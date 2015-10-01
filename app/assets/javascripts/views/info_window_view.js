(function(root) {

  'use strict';

  root.app = root.app || {};
  root.app.View = root.app.View || {};

  root.app.View.InfoWindow = Backbone.View.extend({

    el: 'body',

    template: HandlebarsTemplates['info_window_tpl'],

    events: {
      'click .btn-close' : 'close',
      'click .modal-background': 'close'
    },


    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.defaults, opts);
    },

    render: function(data) {

      var description = data.description || null;
      var source = data.source || null;
      var link = data.source || null;

      this.infoWindow = this.template({
        'description': description,
        'source': source,
        'link': link
      });

      this.$el.append( this.infoWindow );
    },

    close: function() {
      $('.m-modal-window').remove();
      // this.toogleState();
    },

    toogleState: function() {
      this.$el.toggleClass('has-no-scroll');
      $('html').toggleClass('has-no-scroll');
    }

  });

})(this);
