class Structure < ActiveRecord::Base
  include AbAdmin::Models::Structure

  attr_accessible :kind, :position, :parent_id, :title, :redirect_url, :is_visible,
                  :structure_type, :position_type, :slug, :parent

  has_one :picture, as: :assetable, dependent: :destroy, conditions: {is_main: true}
  has_many :pictures, as: :assetable, dependent: :destroy, conditions: {is_main: false}

  fileuploads :picture
  translates :title, :redirect_url
  attr_accessible *all_translated_attribute_names

  include AbAdmin::Concerns::AdminAddition
  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope nested_set.includes(:translations)

  def should_generate_new_friendly_id?
    slug.blank? && new_record?
  end
end
