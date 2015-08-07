(function(root) {

  'use strict';

  root.app = root.app || {};
  root.app.View = root.app.View || {};

  root.app.View.LayersList = Backbone.View.extend({

    defaults: {},

    template: HandlebarsTemplates['layers_list_tpl'],

    events: {
      'click .m-layers-list-header': 'activeList',
      'change input': 'updateLayers',
      'input input.opacity-range' : 'setOpacity',
      'click .panel-trasparecy-switcher' : 'openOpacity'
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.defaults, opts);
      this.layers = settings.layers;
    },

    render: function() {
      var data = { groups: this.layers.getGrouped() };
      this.$el.html( this.template( data ) );
    },

    updateLayers: function() {
      var checkboxes = this.$el.find('.panel-item-switch input:checked');
      var activedIds = _.map(checkboxes, function(el) {
        return parseInt(el.id.split('layer_')[1]);
      });
      _.each(this.layers.models, function(model) {
        var active = _.contains(activedIds, model.id);
        model.set('active', active);
      });
    },

    activeList: function(e) {
      var $el = $(e.currentTarget);
      var $list = $el.closest('li').find('ul:first');
      $list.toggleClass('is-active');
      $el.toggleClass('is-active');
    },


    // Handles opacity ui and update map layers
    setOpacity: function(e) {
      var activeControl = e.currentTarget
      var transparencyLevel = activeControl.value;
      var model = this.layers.get($(activeControl).data('id'));

      $(activeControl).parent().siblings('.opacity-teller').html(transparencyLevel + '%');
      $(activeControl).siblings('.opacity').css({width: transparencyLevel + '%'});

      model.set('opacity',transparencyLevel/100);
    },

    openOpacity: function(e) {
      $(e.currentTarget).parent().toggleClass('is-open');
    }

  });

})(this);

