class Admin::AdminCommentsController < Admin::BaseController
  load_and_authorize_resource

  helper_method :commentable

  before_create do |comment|
    comment.set_author(current_user)
    comment.user_id = comment.resource.user_id if comment.resource.respond_to?(:user_id)
  end

  def create
    create! do |format|
      format.js {}
    end
  end

  def destroy
    destroy! do |format|
      format.js {}
    end
  end

  private

  def collection
    if xhr?
      @collection = AdminComment.find_for_resource(commentable)
    else
      super
    end
  end

  def commentable
    @commentable ||= AdminComment.find_resource(params[:resource_type], params[:resource_id])
  end
end
