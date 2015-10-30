(function(root) {

  'use strict';

  root.app = root.app || {};
  root.app.View = root.app.View || {};

  root.app.View.AnalysisPageView = Backbone.View.extend({

    defaults: {
      elAnalysis: '.m-analysis',
      elWidgets: '.widgets',
      category: '',
      iso: '',
      country: ''
    },

    events: {
      'click .btn-back-analysis': 'hideAnalysis'
    },

    template: HandlebarsTemplates['analysis/analysis_page_tpl'],

    widgets: {
      'bar_chart': 'initBarChart',
      'line_chart': 'initLineChart',
      'number': 'initNumber',
      'text_list': 'initTextList',
      'bar_line_chart': 'initBarLineChart',
      'group_bar_chart': 'initGroupBarChart',
      'group_horizontal_bar_chart': 'initGroupHorizontalBarChart',
      'pyramid_chart': 'initPyramidChart'
    },

    initialize: function(settings) {
      var options = settings && settings.options ? settings.options : settings;
      this.options = _.extend(this.defaults, options);

      this.category = this.options.category;
      this.iso = this.options.iso;
      this.country = this.options.country;
      this.data = this.options.data;
      this.render();
    },

    render: function() {
      this.$el.html(this.template({
        category: this.data.category_name,
        country: this.country
      }));

      $(this.defaults.elAnalysis).addClass('visible');
      $('body').addClass('analyzing');

      this.initializeWidgets();
    },

    initializeWidgets: function() {
      var self = this;

      _.sortBy(this.data.indicators, function(indicator) {
        return indicator.name;
      });

      _.each(this.data.indicators, function(indicator) {
        var widget = indicator.widget;
        var widgetInstance = self.widgets[widget];

        if(widgetInstance) {
          self[widgetInstance](indicator);
        }
      });
    },

    hideAnalysis: function() {
      $(this.defaults.elAnalysis).removeClass('visible');
      $('body').removeClass('analyzing'); 
    },

    initBarChart: function(indicator) {
      var barChart = new root.app.View.WidgetBarChart({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        unit: indicator.unit,
        unitZ: null,
        hasLine: false
      });
    },

    initGroupBarChart: function(indicator) {
      var groupBarChart = new root.app.View.WidgetGroupBarChart({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        labels: indicator.labels,
        unit: indicator.unit
      });
    },

    initGroupHorizontalBarChart: function(indicator) {
      var horizontalBarChart = new root.app.View.WidgetGroupHorizontalBarChart({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        unit: indicator.unit
      });
    },

    initBarLineChart: function(indicator) {
      var barLineChart = new root.app.View.WidgetBarChart({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        unit: indicator.unit,
        unitZ: indicator.unitZ,
        hasLine: true
      });
    },

    initLineChart: function(indicator) {
      var lineChart = new root.app.View.WidgetLineChart({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        unit: indicator.unit
      });
    },

    initNumber: function(indicator) {
      var number = new root.app.View.WidgetNumber({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        unit: indicator.unit
      });
    },

    initTextList: function(indicator) {
      var number = new root.app.View.WidgetTextList({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        unit: indicator.unit
      });
    },

    initPyramidChart: function(indicator) {
      var pyramidChart = new root.app.View.WidgetPyramidChart({
        el: this.options.elWidgets,
        slug: indicator.slug,
        query: indicator.query,
        name: indicator.name,
        iso: this.iso,
        labels: indicator.labels,
        unit: indicator.unit
      });
    }
  });

})(this);