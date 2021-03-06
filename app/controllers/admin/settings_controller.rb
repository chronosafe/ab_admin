class ::Admin::SettingsController < ::Admin::BaseController
  authorize_resource class: Settings

  defaults resource_class: Settings

  def update
    Settings.instance.save(params[:settings])
    Settings.reload_checker.expire
    redirect_to :back
  end

  def cache_clear
    Rails.cache.clear
    render nothing: true
  end

  private

  def action_items
    []
  end

  def collection
    @settings ||= Settings.instance.editable
  end

  def collection_path
    admin_settings_path
  end

  def resource
    Settings.instance
  end

end