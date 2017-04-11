define([
    'jquery',
    'jquery.inputmask',
    'bootstrap-datepicker',
    'moment',
    'backbone',
    'marionette',
    'underscore',
    'hbs!app/applets/narrative_lab_results_grid/modal/dateRangeTemplate',
    'hbs!app/applets/narrative_lab_results_grid/modal/dateRangeHeaderTemplate'
], function($, InputMask, DatePicker, moment, Backbone, Marionette, _, dateRangeTemplate, dateRangeHeaderTemplate) {
    'use strict';

    var fetchCollection = function(fetchOptions) {
        ADK.PatientRecordService.fetchCollection(fetchOptions);
    };

    var DateRangeHeaderView = Backbone.Marionette.ItemView.extend({
        template: dateRangeHeaderTemplate,
        className: 'row',
        initialize: function() {
            this.listenTo(this.model, 'change', this.render);
            /* If the Tesxt Search Applet is Active use these Options */
            if (ADK.SessionStorage.getAppletStorageModel('search', 'useTextSearchFilter')) {
                var modalOptions = ADK.SessionStorage.getAppletStorageModel('search', 'modalOptions');
                this.model.set('selectedId', modalOptions.selectedId);
                if (modalOptions.selectedId === 'custom-range-apply') {
                    this.model.set('customFromDate', modalOptions.customFromDate);
                    this.model.set('customToDate', modalOptions.customToDate);
                }
            }
        }
    });

    var FilterDateRangeView = Backbone.Marionette.LayoutView.extend({
        fetchOptions: {},
        sharedDateRange: {},
        hasCustomDateRangeFieldsBeenInitialized: false,
        template: dateRangeTemplate,
        initialize: function(options) {
            this.parentView = options.parentView;
            this.fullScreen = options.fullScreen;
        },
        regions: {
            dateRangeHeaderRegion: '#dateRangeHeader'
        },
        events: {
            'click button': 'applyDateRange',
            'keydown button': 'handleEnterOrSpaceBar',
            'keyup input': 'monitorCustomDateRange',
            'blur input': 'monitorCustomDateRange',
            'change input': 'monitorCustomDateRange'
        },
        setSharedDateRange: function(value) {
            this.sharedDateRange = value;
        },
        getSharedDateRange: function() {
            return this.sharedDateRange;
        },
        monitorCustomDateRange: function(event) {
            if (this.checkCustomRangeCondition()) {
                this.$el.find('#custom-range-apply').removeAttr('disabled');
            } else {
                this.$el.find('#custom-range-apply').prop('disabled', true);
            }
        },
        setDatePickers: function(fromDate, toDate) {
            this.$('.input-group.date#custom-date-range1').datepicker({
                format: 'mm/dd/yyyy'
            });
            if (fromDate !== null) {
                this.$('.input-group.date#custom-date-range1').datepicker('update', fromDate);
            }

            this.$('.input-group.date#custom-date-range2').datepicker({
                format: 'mm/dd/yyyy'
            });
            if (toDate !== null) {
                this.$('.input-group.date#custom-date-range2').datepicker('update', toDate);
            }

            this.$('#filter-from-date').datepicker('remove');
            this.$('#filter-to-date').datepicker('remove');
        },
        applyDateRange: function(event) {
            var fromDate, toDate;
            var isFetchable = true;

            this.setDateRangeValues = function(timeUnit, timeValue, selectedId) {
                fromDate = moment().subtract(timeUnit, timeValue).format('MM/DD/YYYY');
                toDate = moment().format('MM/DD/YYYY');
                this.model.set('selectedId', selectedId);
            };

            if (event.currentTarget.id.indexOf('-range') !== -1 &&
                event.currentTarget.id.indexOf('custom-range-apply') === -1) {
                this.$el.find('#filter-from-date').val('');
                this.$el.find('#filter-to-date').val('');
                this.$el.find('#custom-range-apply').prop('disabled', true);
            }

            switch (event.currentTarget.id) {
                case 'custom-range-apply':
                    event.preventDefault();
                    var filterFromDate = moment(this.$el.find('#filter-from-date').val());
                    var filterToDate = moment(this.$el.find('#filter-to-date').val());

                    if (filterFromDate <= filterToDate) {
                        fromDate = filterFromDate.format('MM/DD/YYYY');
                        toDate = filterToDate.format('MM/DD/YYYY');
                    } else {
                        toDate = filterFromDate.format('MM/DD/YYYY');
                        fromDate = filterToDate.format('MM/DD/YYYY');
                    }

                    this.sharedDateRange.set('customFromDate', fromDate);
                    this.sharedDateRange.set('customToDate', toDate);

                    this.model.set('selectedId', 'custom-range-apply');
                    break;
                case '2yr-range':
                    this.setDateRangeValues('years', 2, '2yr-range');
                    break;
                case '1yr-range':
                    this.setDateRangeValues('years', 1, '1yr-range');
                    break;
                case '3mo-range':
                    this.setDateRangeValues('months', 3, '3mo-range');
                    break;
                case '1mo-range':
                    this.setDateRangeValues('months', 1, '1mo-range');
                    break;
                case '7d-range':
                    this.setDateRangeValues('days', 7, '7d-range');
                    break;
                case '72hr-range':
                    this.setDateRangeValues('days', 3, '72hr-range');
                    break;
                case '24hr-range':
                    this.setDateRangeValues('days', 1, '24hr-range');
                    break;
                case 'all-range':
                    fromDate = null;
                    toDate = moment().format('MM/DD/YYYY');
                    //toDate = moment().add('years', 100).format('MM/DD/YYYY');
                    this.model.set('selectedId', 'all-range');
                    break;
                default:
                    break;
            }
            var start = 'date.start';
            var end = 'date.end';
            this.fetchOptions.criteria.filter = this.fetchOptions.criteria.filterHold;
            if (fromDate !== undefined && fromDate !== null) {
                this.fetchOptions.criteria[start] = moment(fromDate).startOf('day').format('YYYYMMDDHHmm');
                this.fetchOptions.criteria.filter += ',' + 'gt(observed,' + this.fetchOptions.criteria[start] + ')';
            } else {
                delete this.fetchOptions.criteria[start];
            }

            if (toDate !== undefined && toDate !== null) {
                this.fetchOptions.criteria[end] = moment(toDate).endOf('day').format('YYYYMMDDHHmm');
                this.fetchOptions.criteria.filter += ',' + 'lt(observed,' + this.fetchOptions.criteria[end] + ')';
            } else {
                delete this.fetchOptions.criteria[end];
            }

            this.model.set('fromDate', fromDate);
            this.model.set('toDate', toDate);


            //TODO: Remove this once the new Resource is Created
            this.sharedDateRange.set('fromDate', fromDate);
            this.sharedDateRange.set('toDate', toDate);

            this.$el.find('button').removeClass('active-range');

            if (event.currentTarget.id !== 'custom-range-apply') {
                this.$el.find('#' + event.currentTarget.id).addClass('active-range');
            }

            if (isFetchable) {
                this.fetchDateRangeFilteredCollection();
            }
        },
        onBeforeDestroy: function(event) {
            this.sharedDateRange.set('fromDate', this.model.get('fromDate'));
            this.sharedDateRange.set('toDate', this.model.get('toDate'));
            this.sharedDateRange.set('customFromDate', this.model.get('customFromDate'));
            this.sharedDateRange.set('customToDate', this.model.get('customToDate'));
            this.sharedDateRange.set('selectedId', this.model.get('selectedId'));
            // ADK.SessionStorage.setAppletStorageModel('narrative_lab_results_grid', 'modal_selectedId', this.model.get('selectedId'));
            // ADK.SessionStorage.setAppletStorageModel('narrative_lab_results_grid', 'modal_customFromDate', this.model.get('customFromDate'));
            // ADK.SessionStorage.setAppletStorageModel('narrative_lab_results_grid', 'modal_customToDate', this.model.get('customToDate'));
        },
        checkCustomRangeCondition: function() {
            var hasCustomRangeValuesBeenSetCorrectly = true;
            var customFromDate = this.$el.find('#filter-from-date').val();
            var customToDate = this.$el.find('#filter-to-date').val();

            if (moment(customFromDate, 'MM/DD/YYYY', true).isValid()) {
                this.model.set('customFromDate', customFromDate);
                this.sharedDateRange.set('fromDate', customFromDate);
            } else {
                hasCustomRangeValuesBeenSetCorrectly = false;
            }

            if (moment(customToDate, 'MM/DD/YYYY', true).isValid()) {
                this.model.set('customToDate', customToDate);
                this.sharedDateRange.set('toDate', customToDate);
            } else {
                hasCustomRangeValuesBeenSetCorrectly = false;
            }

            return hasCustomRangeValuesBeenSetCorrectly;
        },
        handleEnterOrSpaceBar: function(event) {
            var keyCode = event ? (event.which ? event.which : event.keyCode) : event.keyCode;

            if (keyCode == 13 || keyCode == 32) {
                var targetElement = this.$el.find('#' + event.currentTarget.id);
                targetElement.focus();
                targetElement.trigger('click');
            }
        },
        onRender: function(event) {
            this.$('#filter-from-date').inputmask('m/d/y', {
                'placeholder': 'MM/DD/YYYY'
            });

            this.$('#filter-to-date').inputmask('m/d/y', {
                'placeholder': 'MM/DD/YYYY'
            });

            this.dateRangeHeaderRegion.show(new DateRangeHeaderView({
                model: this.model
            }));

            var selectedId = this.model.get('selectedId');
            var customFromDate = this.model.get('customFromDate');
            var customToDate = this.model.get('customToDate');
            if (this.parentView.isFromPanel === undefined && this.parentView.isFromNonPanel === undefined) {
                selectedId = ADK.SessionStorage.getAppletStorageModel('narrative_lab_results_grid', 'modal_selectedId');
                customFromDate = ADK.SessionStorage.getAppletStorageModel('narrative_lab_results_grid', 'modal_customFromDate');
                customToDate = ADK.SessionStorage.getAppletStorageModel('narrative_lab_results_grid', 'modal_customToDate');
            }

            if (selectedId !== undefined && selectedId !== null) {
                this.setDatePickers(customFromDate, customToDate);
                this.$el.find('#' + selectedId).click();
            } else {
                if (this.fullScreen) {
                    selectedId = $('[data-appletid=\'narrative_lab_results_grid\'] .grid-filter-daterange .active-range').attr('id') || 'custom-range-apply';
                    customFromDate = $('[data-appletid=\'narrative_lab_results_grid\'] .grid-filter-daterange #filter-from-date-narrative_lab_results_grid').val();
                    customToDate = $('[data-appletid=\'narrative_lab_results_grid\'] .grid-filter-daterange #filter-to-date-narrative_lab_results_grid').val();
                } else {


                    var globalDate = ADK.SessionStorage.getModel('globalDate');
                    selectedId = globalDate.get('selectedId');
                    customFromDate = globalDate.get('customFromDate');
                    customToDate = globalDate.get('customToDate');
                }

                this.model.set('selectedId', selectedId);
                this.model.set('customFromDate', customFromDate);
                this.model.set('customToDate', customToDate);

                this.setDatePickers(customFromDate, customToDate);

                if (selectedId !== undefined && selectedId !== null && selectedId.trim().length > 0) {
                    if (selectedId.indexOf('2yr-range') >= 0) {
                        this.$el.find('#2yr-range').click();
                    } else if (selectedId.indexOf('1yr-range') >= 0) {
                        this.$el.find('#1yr-range').click();
                    } else if (selectedId.indexOf('3mo-range') >= 0) {
                        this.$el.find('#3mo-range').click();
                    } else if (selectedId.indexOf('1mo-range') >= 0) {
                        this.$el.find('#1mo-range').click();
                    } else if (selectedId.indexOf('7d-range') >= 0) {
                        this.$el.find('#7d-range').click();
                    } else if (selectedId.indexOf('72hr-range') >= 0) {
                        this.$el.find('#72hr-range').click();
                    } else if (selectedId.indexOf('24hr-range') >= 0) {
                        this.$el.find('#24hr-range').click();
                    } else if (selectedId.indexOf('all-range') >= 0) {
                        this.$el.find('#all-range').click();
                    } else if (selectedId.indexOf('custom-range-apply') >= 0) {
                        if (!this.$el.find('custom-range-apply').prop('disabled')) {
                            this.$el.find('#custom-range-apply').click();
                        }
                    }
                }
            }
        },
        fetchDateRangeFilteredCollection: function() {
            ADK.PatientRecordService.fetchCollection(this.fetchOptions);
            this.parentView.leftColumn.show(ADK.Views.Loading.create()); // this.parentView.tableLoadingView);
            //   this.parentView.chart.show(ADK.Views.Loading.create()); // this.parentView.chartLoadingView);
        },
        setFetchOptions: function(fetchOptions) {
            this.fetchOptions = fetchOptions;
        }
    });

    return FilterDateRangeView;
});
