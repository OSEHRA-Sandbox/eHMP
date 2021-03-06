define([
    "backbone",
    "marionette",
    "underscore",
    "handlebars",
    "moment",
    "hbs!app/applets/patient_information/postings/templates/detail",
    "hbs!app/applets/patient_information/postings/templates/allergiesDetails",
    "hbs!app/applets/patient_information/postings/templates/directiveDetails",
    "hbs!app/applets/patient_information/postings/templates/patientFlagsDetails"
], function(
    Backbone,
    Marionette,
    _,
    Handlebars,
    moment,
    DetailTemplate,
    AllergiesDetailsTemplate,
    DirectiveDetails,
    PatientFlagsDetails
) {
    "use strict";
    var cwadDetail = Backbone.Marionette.ItemView.extend({
        className: "col-xs-12 group-wrapper",
        initialize: function(options) {
            this.template = options.template;
        }
    });

    var LoadingView = Backbone.Marionette.ItemView.extend({
        template: Handlebars.compile('<h5 class="loading"><i class="fa fa-spinner fa-spin"></i> Loading...</h5>'),
    });

    var NoResultsView = Backbone.Marionette.ItemView.extend({
        template: Handlebars.compile('<div aria-live="assertive"><p class="error-message padding" role="alert">No results found.</p></div>'),
        tagName: "p"
    });
    var ErrorView = Backbone.Marionette.ItemView.extend({
        template: Handlebars.compile('<div aria-live="assertive"><p class="error-message padding" role="alert">Error: {{errorCode}}</p></div>'),
        initialize: function(options) {
            this.model.set('errorCode', options.errorCode);
        },
        tagName: "p"
    });

    var HeaderView = Backbone.Marionette.ItemView.extend({
        template: Handlebars.compile([
            '<div data-flex-width="1" class="header-title-container">',
            '<h4 class="panel-title">{{title}}</h4>',
            '</div>',
            '<div class="header-help-button-container top-padding-xs"></div>'
        ].join('\n')),
        behaviors: function() {
            return {
                FlexContainer: {
                    direction: 'row'
                },
                HelpLink: {
                    container: '.header-help-button-container',
                    mapping: this.getOption('model').get('helpMapping'),
                    buttonOptions: {
                        colorClass: 'bgc-primary-dark'
                    }
                }
            };
        },
        className: 'left-padding-sm right-padding-sm panel-heading'
    });

    var TitleModel = Backbone.Model.extend({
        defaults: {
            'title': '',
            'description': ''
        }
    });
    var CwadDetailsView = Backbone.Marionette.CollectionView.extend({
        childView: cwadDetail,
        emptyView: LoadingView,
        initialize: function(options) {
            this.childViewOptions = {
                template: Handlebars.compile('Empty')
            };
            if (!_.isEqual(options.cwadIdentifier, 'patient flags')) {
                this.emptyViewOptions = {
                    errorCode: 'undefined'
                };
                var range;
                var sort = function(item) {
                    var enteredDate = moment(item.get('entered'), 'YYYYMMDDHHmmss').valueOf();
                    return -enteredDate;
                };

                if (options.cwadIdentifier === 'crisis notes') {
                    range = 'Crisis Note';
                    this.cwadfCode = 'C';
                    this.childViewOptions.template = DirectiveDetails;
                    this.setupNoteListener();
                } else if (options.cwadIdentifier === 'warnings') {
                    range = 'Clinical Warning';
                    this.childViewOptions.template = DirectiveDetails;
                    this.cwadfCode = 'W';
                    this.setupNoteListener();
                } else if (options.cwadIdentifier === 'allergies') {
                    range = 'Allergy/Adverse Reaction';
                    this.childViewOptions.template = AllergiesDetailsTemplate;
                    this.cwadfCode = 'A';
                    sort = function(a, b) {
                        var acuityNameA = a.get('severity') || '';
                        var acuityNameB = b.get('severity') || '';
                        if (acuityNameB.localeCompare(acuityNameA) !== 0) {
                            return acuityNameB.localeCompare(acuityNameA);
                        } else {
                            var enteredA = a.get('entered') || '';
                            var enteredB = b.get('entered') || '';
                            return enteredB.localeCompare(enteredA);
                        }
                    };
                    this.listenTo(ADK.Messaging.getChannel('allergies'), 'create:success eie:success', function() {
                        this.updatePostingsDetails();
                    });
                } else if (options.cwadIdentifier === 'directives') {
                    range = 'Advance Directive';
                    this.childViewOptions.template = DirectiveDetails;
                    this.cwadfCode = 'D';
                    this.setupNoteListener();
                } else {
                    range = '';
                    this.childViewOptions.template = Handlebars.compile('Empty');
                }
                var fetchOptions = {
                    resourceTitle: 'patient-record-cwad',
                    criteria: {
                        range: range
                    },
                    cache: false,
                    collectionConfig: {
                        comparator: sort
                    },
                    viewModel: {
                        parse: function(response) {
                            if (response.observations) {
                                response = ADK.utils.extract(response, response.observations[0], {
                                    severity: 'severity',
                                    observed: 'date'
                                });
                                if (response.observed && response.observed.length === 4) {
                                    response.observedDate = response.observed;
                                } else if (response.observed && response.observed.length === 6) {
                                    response.observedDate = ADK.utils.formatDate(response.observed + '01', 'MMM YYYY');
                                } else if (response.observed && response.observed.length == 8) {
                                    response.observedDate = ADK.utils.formatDate(response.observed, "MM/DD/YYYY");
                                } else {
                                    response.observedDate = ADK.utils.formatDate(response.observed, "MM/DD/YYYY - HH:mm");
                                }
                            }
                            if (response.nationalTitle && response.nationalTitle.name) {
                                response.standardTitle = response.nationalTitle.name;
                            }
                            if (_.isArray(response.clinicians)) {
                                var expectedCosigner = _.findWhere(response.clinicians, {
                                    role: 'EC'
                                });
                                if (expectedCosigner) {
                                    response.expectedCosignerDisplayName = expectedCosigner.displayName;
                                }
                            }

                            if(response.statusDisplayName){
                                var lstatusName = response.statusDisplayName.toLowerCase();
                                response.statusDisplayName = _.capitalize(lstatusName);
                                if( lstatusName === 'complete' || lstatusName === 'completed'){
                                   response.statusDisplayName =  'Completed';
                                }
                            }

                            return response;
                        }
                    }
                };
                fetchOptions.onSuccess = function(collection, resp) {
                    collection.trigger('collection:success', collection);
                };
                fetchOptions.onError = function(collection, resp) {
                    collection.trigger('collection:error', resp);
                };
                this.collection = new Backbone.Collection();
                this.listenTo(this.collection, 'collection:success', function(collection) {
                    this.emptyView = NoResultsView;
                });
                this.listenTo(this.collection, 'collection:error', function(resp) {
                    this.emptyViewOptions.errorCode = resp.status;
                    this.emptyView = ErrorView;
                });
                this.collection = ADK.PatientRecordService.fetchCollection(fetchOptions, this.collection);
                this.listenTo(options.patientModel, 'change', function(patientModel) {
                    if (this.hasChanged(patientModel)) {
                        this.updatePostingsDetails();
                    }
                });
                // Allow for the details list to have a forced refresh
                this.listenTo(ADK.Messaging, 'refresh-all-patient', function() {
                    this.updatePostingsDetails();
                });
            } else {
                this.cwadfCode = 'F';
                this.listenTo(options.patientModel, 'change', function(patientModel) {
                    if (this.hasChanged(patientModel)) {
                        this.updateFlagsDetails(patientModel);
                    }
                });
                // Allow for the flags list to have a forced refresh
                this.listenTo(ADK.Messaging, 'refreshed.ehmp.patient', function() {
                    this.updateFlagsDetails();
                });
                this.childViewOptions.template = PatientFlagsDetails;
                this.collection = new Backbone.Collection(options.patientModel.get('patientRecordFlag'));
            }
        },
        setupNoteListener: function() {
            var self = this;
            this.listenTo(ADK.Messaging.getChannel('notes'), 'note:signed addendum:signed', function(resp) {
                if (_.isUndefined(resp)) {
                    return;
                }
                var successes = _.get(resp, 'data.successes');
                if (successes && successes.find(function(model) {
                        return (model.get('documentTypeCode') === self.cwadfCode && (model.get('status') === 'COMPLETED' || model.get('status') === 'AMENDED'));
                    })) {
                    this.updatePostingsDetails();
                }
            });
        },
        updateFlagsDetails: function(patientModel) {
            patientModel = patientModel || ADK.PatientRecordService.getCurrentPatient();
            this.collection.reset(patientModel.get('patientRecordFlag'));
        },
        updatePostingsDetails: function() {
            this.emptyView = LoadingView;
            this.collection.reset();
            ADK.PatientRecordService.fetchCollection(this.collection.fetchOptions, this.collection);
        },
        hasChanged: function(patientModel) {
            return (!_.isEqual(patientModel.get('pid'), patientModel.previous('pid')) || _.contains(patientModel.get('cwadf'), this.cwadfCode) !== _.contains(patientModel.previous('cwadf'), this.cwadfCode));
        }
    });
    var PostingsContainerView = Backbone.Marionette.LayoutView.extend({
        behaviors: {
            FlexContainer: {
                direction: 'column'
            }
        },
        template: DetailTemplate,
        className: 'container-fluid panel panel-default',
        regions: {
            cwadDetails: '.cwad-detail-list',
            headerRegion: '.header-content-container'
        },
        events: {
            'click .close': 'closeDetail'
        },
        initialize: function(options) {
            this.model = new TitleModel({
                title: options.cwadIdentifier,
                description: options.cwadDescription,
                helpMapping: this.getOption('helpMapping')
            });
        },
        modelEvents: {
            "change:cwadf": "render"
        },
        onRender: function() {
            this.cwadDetails.show(new CwadDetailsView(this.options));
            this.showChildView('headerRegion', new HeaderView({
                model: this.model
            }));
        }
    });

    return PostingsContainerView;
});
