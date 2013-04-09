class Admin::StaticPagesController < Admin::BaseController
  load_and_authorize_resource

  defaults singleton: true

  belongs_to :structure

  def settings
    {}
  end

  def parent_class
    Structure
  end
end
