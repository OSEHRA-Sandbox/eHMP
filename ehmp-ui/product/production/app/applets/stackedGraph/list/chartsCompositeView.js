define([
    'backbone',
    'marionette',
    'underscore',
    'highcharts',
    'hbs!app/applets/stackedGraph/list/chartsCompositeViewTemplate',
    'app/applets/stackedGraph/utils/utils',
    'app/applets/stackedGraph/list/rowItemView',
    'app/applets/medication_review_v2/medicationResourceHandler',
    'app/applets/medication_review_v2/medicationCollectionHandler',
    'app/applets/medication_review_v2/charts/stackedGraph',
    'app/applets/lab_results_grid/applet',
    'app/applets/vitals/applet',
    'typeahead',
    'highcharts-more'
], function(Backbone, Marionette, _, Highcharts, ChartsCompositeViewTemplate, Utils, RowItemView, MedsResource, CollectionHandler) {
    "use strict";

    function makeString(object) {
        if (object === null) {
            return '';
        }
        return '' + object;
    }

    function capitalize(str, lowercaseRest) {
        str = makeString(str);
        var remainingChars = !lowercaseRest ? str.slice(1) : str.slice(1).toLowerCase();

        return str.charAt(0).toUpperCase() + remainingChars;
    }

    function titleize(str) {
        return makeString(str).toLowerCase().replace(/(?:^|\s|-)\S/g, function(c) {
            return c.toUpperCase();
        });
    }

    var ChartsCompositeView = Backbone.Marionette.CompositeView.extend({
        template: ChartsCompositeViewTemplate,
        childViewContainer: '.collectionContainer',
        childView: RowItemView,
        events: {
            'reorder': 'reorderRows',
        },
        eventString: function() {
            return [
                'focusin.' + this.cid,
                'click.' + this.cid
            ].join(' ');
        },
        childEvents: {
            'before:showtoolbar': function(e) {
                this.hidePopovers();
                this.closeToolbar();
            },
            'after:showtoolbar': function(e, view) {
                this.activeToolbar = view;
                this.setDocHandler();
            },
            'after:hidetoolbar': function(e) {
                this.activeToolbar = '';
                this.hidePopovers();
                $(document).off(this.eventString());
            },
            'toggle:quicklook': function(e) {
                var el = $(e.ui.popoverEl);
                this.setDocHandler();
                Messaging.getChannel('gists').trigger('close:quicklooks', el);
                el.popup('toggle');
            }
        },
        setDocHandler: function() {
            $(document).off(this.eventString());
            $(document).on(this.eventString(), {
                view: this
            }, this.documentHandler);
        },
        documentHandler: function(e) {
            var view = e.data.view;
            if (view.$(e.target).length || view.options.preventFocusoutClose) {
                return;
            }
            ADK.Messaging.getChannel('gists').trigger('close:gists').trigger('close:quicklooks');
            $(document).off(view.eventString());
        },
        initialize: function(options) {
            this.instanceId = options.instanceId;
            this.allReadyAdded = options.options.allReadyAdded;
            this.childViewOptions = {
                activeCharts: options.activeCharts,
                timeLineCharts: options.timeLineCharts
            };

            this.listenTo(ADK.Messaging.getChannel('gists'), 'close:gists', function(e) {
                this.closeToolbar();
            });
            this.listenTo(ADK.Messaging.getChannel('gists'), 'close:quicklooks', function(el) {
                this.$('[data-toggle=popover]').not(el).popup('hide');
            });
        },
        reorderRows: function(target, reorderObj) {
            var self = this;
            if (reorderObj.oldIndex !== reorderObj.newIndex) {
                var temp = this.collection.at(reorderObj.oldIndex);
                this.collection.remove(temp);
                this.collection.add(temp, {
                    at: reorderObj.newIndex
                });
                var model = Utils.buildUpdateModel(ADK.ADKApp.currentScreen.config.id, self.instanceId, self.collection);
                model.save(null, {
                    success:function(model, response) {
                        var screenId = ADK.ADKApp.currentScreen.config.id;
                        var screenObject = _.findWhere(response.data.userDefinedGraphs, {id: screenId});
                        if(screenObject){
                            var appletsObject = _.findWhere(screenObject.applets, {instanceId: self.instanceId});
                            if(appletsObject && appletsObject.graphs){
                                ADK.UserDefinedScreens.reorderStackedGraphsInSession(screenId, self.instanceId, appletsObject.graphs);
                            }
                        }
                    },
                    error: function(model) {
                    }
                });
            }

            this.closeToolbar();
        },
        closeToolbar: function(e) {
            var childView = this.$childViewContainer;
            if (childView && this.activeToolbar) {
                this.activeToolbar.hide();
                childView.find('.toolbarActive').removeClass('toolbarActive');
            }
            this.activeToolbar = null;
        },
        hidePopovers: function(e) {
            this.$('[data-toggle=popover]').popup('hide');
            ADK.Messaging.getChannel('gists').trigger('close:quicklooks');
        },
        onDestroy: function() {
            $(this.el).find('.placeholder-tile-sort').remove();
            $(document).off(this.eventString());
        },
        onShow: function() {
            var self = this;
            $(this.el).find('.collectionContainer').append('<div class="placeholder-tile-sort hidden"/>');
            $(this.el).find('.placeholder-tile-sort').on('dragover', function(e) {
                e.preventDefault();
            });

            $(this.el).find('.placeholder-tile-sort').on('drop', function(e) {
                var index = e.originalEvent.dataTransfer.getData('text');
                var originalIndex = Number(index);
                var targetIndex = $(this).index() - 2;
                $(this).addClass('hidden');

                if (originalIndex > targetIndex)
                    targetIndex++;

                var reorder = {
                    oldIndex: originalIndex,
                    newIndex: targetIndex
                };

                self.reorderRows(e, reorder);
            });

            this.$noGraph = self.$('.noGraph');
            if (!ADK.UserService.hasPermission('access-stack-graph')) {
                return;
            }

            var currentScreen = ADK.Messaging.request('get:current:screen');

            var interval = setInterval(function() {
                if (self.$el.parents('.panel.panel-primary').find('.pickList').find('.typeahead').length > 0) {
                    clearInterval(interval);
                    var theTypeahead = self.$el.parents('.panel.panel-primary').find('.pickList').find('.typeahead');
                    var substringMatcher = function(strs, type) {
                        return function findMatches(q, cb) {
                            var matches, substrRegex;

                            // an array that will be populated with substring matches
                            matches = [];

                            // regex used to determine if a string contains the substring `q`
                            substrRegex = new RegExp(q, 'i');

                            // iterate through the pool of strings and for any string that
                            // contains the substring `q`, add it to the `matches` array
                            $.each(strs, function(i, str) {
                                if (substrRegex.test(str)) {
                                    // the typeahead jQuery plugin expects suggestions to a
                                    // JavaScript object, refer to typeahead docs for more info
                                    var match = {
                                        value: str,
                                        type: type
                                            // displayKey: capitalize(str)
                                    };
                                    var displayValue = str;
                                    if (str === 'LDL CHOLESTEROL') {
                                        displayValue = 'LDL ' + titleize('CHOLESTEROL');
                                    } else if (str !== 'BMI' && str !== 'HDL') {
                                        displayValue = titleize(str);
                                    }
                                    match.displayValue = displayValue;
                                    if (_.indexOf(self.allReadyAdded, (str.toUpperCase() + '-' + type.toUpperCase())) === -1) {
                                        match.allReadyAdded = false;
                                    } else {
                                        match.allReadyAdded = true;
                                    }

                                    if (!currentScreen.config.predefined) {
                                        match.predefined = false;
                                    } else if (currentScreen.config.predefined) {
                                        match.predefined = true;
                                    }
                                    matches.push(match);
                                }
                            });

                            cb(matches);
                        };
                    };

                    var vitalDeferred = $.Deferred();
                    var labDeferred = $.Deferred();
                    var medDeferred = $.Deferred();

                    var vitalFetchOptions = {
                        resourceTitle: 'operational-data-type-vital',
                        onSuccess: function(collection) {
                            vitalDeferred.resolve({
                                coll: collection
                            });
                        }
                    };

                    ADK.ResourceService.fetchCollection(vitalFetchOptions);

                    var labFetchOptions = {
                        resourceTitle: 'operational-data-type-laboratory',
                        onSuccess: function(collection) {
                            labDeferred.resolve({
                                coll: collection
                            });
                        }
                    };

                    ADK.ResourceService.fetchCollection(labFetchOptions);

                        var medFetchOptions = {
                            resourceTitle: 'operational-data-type-medication',
                            onSuccess: function(collection) {
                                medDeferred.resolve({
                                    coll: collection
                                });
                            }
                        };
                        CollectionHandler.fetchAllMeds(false, function(collection) {
                            var groupNames = MedsResource.getMedicationGroupNames(collection);
                            medDeferred.resolve({
                                coll: groupNames,
                                collection: collection
                            });
                        });

                    // ADK.ResourceService.fetchCollection(medFetchOptions);

                    var sortFunc = function(a, b) {
                        if (a < b) {
                            return -1;
                        }

                        if (a > b) {
                            return 1;
                        }

                        // a must be equal to b
                        return 0;
                    };

                    $.when(vitalDeferred, labDeferred, medDeferred).done(
                        function(vitalPickListCollection, labPickListCollection, medPickListCollection) {
                            //self._base.render.apply(self, arguments);
                            var vitalPickList = vitalPickListCollection.coll.pluck('name');
                            vitalPickList.push('BMI');
                            vitalPickList.sort(sortFunc);

                            var labPickList = labPickListCollection.coll.pluck('name');
                            labPickList.sort(sortFunc);

                            var medPickList = [];
                            medPickList = medPickListCollection.coll;
                            medPickList.sort(sortFunc);


                            var pickListItemTemplate = '<% if(allReadyAdded && predefined){ %><%} else if((!allReadyAdded && !predefined)  || (!allReadyAdded && predefined)) { %><div style="margin: 0px -15px; width: 271px; display: flex;"><div style="width: 228px"><p class="text-capitalize" style="white-space:normal;"><%= displayValue %> <i class="text-muted"><%= type %></i></p></div><div style="width: 42px"><span class="text-muted small"><i class="fa fa-plus"></i> Add</span></div></div><% } else if(allReadyAdded && !predefined) { %><div style="margin: 0px -15px; width: 271px; display: flex;"><div style="width: 228px"><p class="text-capitalize" style="white-space:normal;"><%= displayValue %> <i class="text-muted"><%= type %></i></p></div><div style="width: 42px"><span class="text-muted small"><i class="fa fa-minus"></i> Delete</span></div></div><% } %>';
                            var emptyItemTemplate = '<div class="empty-container"> No results found for&nbsp;<strong><%= query %></strong>&nbsp;under';
                            theTypeahead.typeahead({
                                    hint: false,
                                    highlight: true,
                                    minLength: 3
                                }, {
                                    name: 'vitals',
                                    displayKey: 'displayValue',
                                    source: substringMatcher(vitalPickList, 'Vitals'),
                                    templates: {
                                        suggestion: _.template(pickListItemTemplate),
                                        empty: _.template(emptyItemTemplate + ' Vitals </div>')
                                    }
                                }, {
                                    name: 'labs',
                                    displayKey: 'displayValue',
                                    source: substringMatcher(labPickList, 'Lab Tests'),
                                    templates: {
                                        suggestion: _.template(pickListItemTemplate),
                                        empty: _.template(emptyItemTemplate + ' Lab Tests </div>')
                                    }
                                }, {
                                    name: 'meds',
                                    displayKey: 'displayValue',
                                    source: substringMatcher(medPickList, 'Medications'),
                                    templates: {
                                        suggestion: _.template(pickListItemTemplate),
                                        empty: _.template(emptyItemTemplate + ' Medications </div>')
                                    }
                                })
                                .on('typeahead:opened', function() {
                                    var ttDrop = theTypeahead.parents('.twitter-typeahead').find('.tt-dropdown-menu');
                                    if (ttDrop.find('.youTyped').length === 0) {
                                        ttDrop.prepend($('<p/>', {
                                            'class': 'youTyped',
                                            'text': 'Hello'
                                        }));
                                    }
                                })
                                .on('typeahead:selected', function(e, suggestion, dataset) {

                                    if (suggestion.allReadyAdded) {

                                        var model = self.collection.find(function(model) {
                                            return (model.get('typeName') === suggestion.value.toUpperCase() && model.get('graphType') === suggestion.type);
                                        });

                                        ADK.Messaging.getChannel('stackedGraph').trigger('delete', {
                                            model: model
                                        });

                                    } else {
                                        var params = {
                                            typeName: suggestion.value,
                                            instanceId: self.instanceId,
                                            graphType: suggestion.type
                                        };

                                        if (!ADK.ADKApp.currentScreen.config.predefined) {
                                            var pickListPersistanceFetchOptions = {
                                                resourceTitle: 'user-defined-stack',
                                                fetchType: 'POST',
                                                criteria: {
                                                    id: ADK.ADKApp.currentScreen.config.id,
                                                    instanceId: self.instanceId,
                                                    graphType: suggestion.type,
                                                    typeName: suggestion.value.toUpperCase()
                                                }
                                            };


                                            ADK.ResourceService.fetchCollection(pickListPersistanceFetchOptions);

                                            ADK.UserDefinedScreens.addOneStackedGraphToSession(
                                                ADK.ADKApp.currentScreen.config.id,
                                                self.instanceId,
                                                suggestion.type,
                                                suggestion.value.toUpperCase());

                                        }


                                        $(this).typeahead('val', '');

                                        var channel, deferredResponse;
                                        if (suggestion.type === 'Vitals') {
                                            channel = ADK.Messaging.getChannel('vitals');
                                            deferredResponse = channel.request('chartInfo', params);
                                        } else if (suggestion.type === 'Lab Tests') {
                                            channel = ADK.Messaging.getChannel('lab_results_grid');
                                            deferredResponse = channel.request('chartInfo', params);
                                        } else if (suggestion.type === 'Medications') {
                                            channel = ADK.Messaging.getChannel('meds_review');
                                            params.collection = medPickListCollection.collection;
                                            deferredResponse = channel.request('chartInfo', params);
                                        }
                                        //end of else
                                    }
                                })
                                .click(function(e) {
                                    e.stopPropagation();
                                })
                                .on('keyup keydown', function(e) {
                                    if (e.keyCode === 32) {
                                        e.stopPropagation();
                                    }
                                })
                                .on('keyup', function(e) {
                                    var val = $(this).val();
                                    theTypeahead.parents('.twitter-typeahead').find('.tt-dropdown-menu .youTyped').text('Search for ' + val);
                                });
                        });
                    theTypeahead.parents('.dropdown').on('hidden.bs.dropdown', function() {
                        theTypeahead.typeahead('val', '');
                    });

                    theTypeahead.parents('.dropdown').on('click', function() {
                        window.requestAnimationFrame(function() {
                            theTypeahead[0].focus();
                        });
                    });

                }

            }, 500);
        }
    });
    return ChartsCompositeView;
});
