define([
    'backbone',
    'marionette',
    'app/applets/patient_selection/views/baseSearchView',
    'app/applets/patient_selection/views/table/view',
    'app/applets/patient_selection/views/mySite/filter'
], function(
    Backbone,
    Marionette,
    BaseSearchView,
    SearchResultsCollectionView,
    MySiteFilter
) {
    'use strict';

    var SearchView = BaseSearchView.extend({
        _emptyMessage: 'No results found. Verify search criteria.',
        FilterView: Backbone.Marionette.ItemView.extend({
            template: Handlebars.compile('<p>Enter either first letter of last name <strong>and</strong> last four of social security number, or generic name in the search field above.</p>')
        }),
        patientRecordResultsCollectionEvents: {
            'error': 'onError'
        },
        resultsView: SearchResultsCollectionView.extend({
            attributes: {
                "aria-controls": "patientSelectionMySiteSearchText"
            }
        }),
        initialize: function() {
            this.bindEntityEvents(this.collection, this.patientRecordResultsCollectionEvents);
            this.listenTo(ADK.Messaging.getChannel('patient-selection-mySite'), 'execute-search', this.executeSearch);
            this.setEmpty();
        },
        onBeforeShow: function() {
            this.searchResultsRegion.$el.addClass('hidden');
        },
        executeSearch: function(fullNameFilter) {
            if (!_.isEmpty(fullNameFilter) && _.isString(fullNameFilter)) {
                if (this.collection.xhr) this.collection.xhr.abort();
                if (fullNameFilter.length < 3) {
                    this.setEmpty();
                    this.collection.reset();
                    return;
                }
                this.searchResultsRegion.$el.removeClass('hidden');
                this.$el.trigger('patientSearchTray.show');

                // Transfer Focus to the tray even when it is open
                ADK.Messaging.request('tray:patientSelection:mySite:trayView').setFocusToFirstMenuItem();

                var searchOptions = {
                    viewcollection: {
                        defaults: {
                            ageYears: 'Unk'
                        }
                    },
                    cache: true
                };

                var last5Pattern = /^[a-zA-Z]\d{4}$/;
                if (last5Pattern.test(fullNameFilter)) {
                    searchOptions.criteria = {
                        'last5': fullNameFilter
                    };
                    searchOptions.resourceTitle = 'patient-search-last5';
                } else {
                    searchOptions.criteria = {
                        'name.full': fullNameFilter,
                        'rows.max': 100
                    };
                    searchOptions.resourceTitle = 'patient-search-full-name';
                }
                ADK.ResourceService.fetchCollection(searchOptions, this.collection);
            }
        },
        onError: function(collection, resp, options) {
            collection.reset(null, {
                silent: true
            });
            if (_.isEqual(resp.statusText, "abort")) {
                return;
            }
            if (resp.status === 406) {
                var response = JSON.parse(resp.responseText);
                var totalRowsFound = response.data.items[0].totalRowsFound;
                var maxRowsAllowed = response.data.items[0].maxRowsAllowed;
                this.showError('The number of rows returned (' + totalRowsFound + ') exceeds the maximum allowable (' + maxRowsAllowed + '). Be more specific in your search criteria. ');
            } else if (resp.status === 400) {
                this.showError('Invalid search criteria.');
            } else {
                this.showError('There was an error retrieving the patient list. Try again later.');
            }
        },
        onBeforeDestroy: function() {
            this.unbindEntityEvents(this.collection, this.patientRecordResultsCollectionEvents);
        }
    });

    ADK.Messaging.trigger('register:component', {
        type: "contextNavigationItem",
        group: ["staff", "staff-left"],
        key: "mySitePatientSelectionInput",
        view: MySiteFilter,
        orderIndex: 1,
        shouldShow: function() {
            return (ADK.UserService.hasPermissions('read-patient-record'));
        }
    });

    return SearchView;
});