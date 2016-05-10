# == Schema Information
#
# Table name: layers
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  slug               :string           not null
#  layer_type         :string
#  zindex             :integer
#  active             :boolean
#  order              :integer
#  color              :string
#  info               :text
#  layer_provider     :string
#  css                :text
#  interactivity      :text
#  opacity            :float
#  query              :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  locate_layer       :boolean          default(FALSE)
#  icon_class         :string
#  published          :boolean          default(TRUE)
#  legend             :text
#  zoom_max           :integer          default(100)
#  zoom_min           :integer          default(0)
#  layer_group_id     :integer
#  dashboard_order    :integer
#  download           :boolean          default(FALSE)
#  dataset_shortname  :string
#  dataset_source_url :text
#

class LayerSerializer < ActiveModel::Serializer
  cache key: "layer"
  attributes :name, :slug, :layer_type, :zindex, :opacity, :active, :order, :dashboard_order, :color, :info, :interactivity, :css, :query, :layer_provider, :published, :locate_layer, :icon_class, :legend, :zoom_max, :zoom_min, :download, :dataset_shortname, :dataset_source_url
  has_one :layer_group, serializer: LayerGroupSerializer
  def type
    'layers'
  end
  def layer_group
    object.layer_groups.where(site_scope_id: options[:site_scope]).first
  end
end
