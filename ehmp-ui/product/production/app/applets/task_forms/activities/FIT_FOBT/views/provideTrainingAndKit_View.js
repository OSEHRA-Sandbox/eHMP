define([
        'backbone',
        'marionette',
        'underscore',
        'handlebars',
        'hbs!app/applets/task_forms/activities/FIT_FOBT/templates/followUp_Template',
        'app/applets/task_forms/common/utils/eventHandler'
    ],
    function(Backbone, Marionette, _, Handlebars, FollowUpTemplate, EventHandler) {
        "use strict";

        var ProvideTaskModel = Backbone.Model.extend({
            validate: function(attributes, options) {
                this.errorModel.clear();

                var errormsgs = {
                    'out_training_completed': 'You must provide the kit to the patient'
                };

                for (var key in errormsgs) {
                    var value = $.trim(this.get(key));

                    switch (key) {
                        case 'out_training_completed':
                            if (value === '' || value === 'false') {
                                this.errorModel.set(key, errormsgs[key]);
                            }
                            break;
                    }
                }

                if (!_.isEmpty(this.errorModel.toJSON())) {
                    return "Validation errors. Please fix.";
                }
            }
        });

        var ProvideTaskForm = ADK.UI.Form.extend({
            _super: ADK.UI.Form.prototype,
            fields: [{
                control: 'container',
                extraClasses: ['modal-body'],
                items: [{
                    control: 'container',
                    template: FollowUpTemplate,
                    items: [{
                        control: 'container',
                        extraClasses: ['all-padding-md'],
                        items: [{
                            control: 'checkbox',
                            name: 'out_training_completed',
                            label: 'Kit Provided',
                            title: 'Kit Provided'
                        }, {
                            control: 'textarea',
                            name: 'out_training_notes',
                            label: 'Notes',
                            placeholder: 'Notes',
                            rows: 15
                        }, {
                            control: 'checkbox',
                            name: 'out_training_follow_up',
                            label: 'Mark as Follow Up',
                            title: 'Mark as Follow Up'
                        }]
                    }]
                }]
            }, {
                control: 'container',
                extraClasses: ['modal-footer'],
                items: [{
                    control: 'button',
                    title: 'Press enter to cancel.',
                    extraClasses: ['btn', 'btn-default', 'btn-sm'],
                    id: 'modal-cancel-button',
                    type: 'button',
                    label: 'Cancel',
                }, {
                    control: 'button',
                    title: 'Press enter to complete',
                    extraClasses: ['btn', 'btn-success', 'btn-sm'],
                    id: 'modal-save-button',
                    type: 'button',
                    label: 'Complete'
                }]
            }],
            onInitialize: function(options) {
                // Store the task information
                // this.taskModel = options.taskModel;
                // 

                var expDate = this.taskModel.get('EXPIRATIONTIME');
                if (expDate !== null) {
                    this.taskModel.set('dueDateTime', moment(expDate).format('lll'));
                } else {
                    this.taskModel.set('dueDateTime', '');
                }

                this.model.set('taskModel', this.taskModel.toJSON());

                if (this.model.errorModel) {
                    this.model.errorModel.clear();
                }

                var fetchOptions = {
                    resourceTitle: 'tasks-update',
                    fetchType: 'POST',
                    criteria: {
                        taskid: this.taskModel.get('TASKID'),
                        state: 'start'
                    }
                };
                ADK.ResourceService.fetchCollection(fetchOptions);
            },
            events: {
                'click .btn-success': 'completeTask',
                'click #modal-cancel-button': 'fireCloseEvent'
            },
            completeTask: function(e) {
                if (this.model.isValid()) {
                    EventHandler.completeTask.call(this, e, this.parentView, this.taskListView);
                } else {
                    return;
                }
            },
            fireCloseEvent: function(e) {
                EventHandler.fireCloseEvent.call(this, e);
            }
        });

        return {
            form: ProvideTaskForm,
            model: ProvideTaskModel
        };


    });