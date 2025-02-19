class PageTagsController < ApplicationController
  # Remove a tag and all of its links to a page
  def remove
    # Params
    # {"page_type"=>"Location", "slug"=>"mountains", "controller"=>"page_tags", "action"=>"remove"
    return unless params.key?(:page_type) && params.key?(:slug)

    PageTag.where(
      page_type: params[:page_type],
      slug:      params[:slug],
      user_id:   current_user.id
    ).destroy_all

    return redirect_back fallback_location: root_path, notice: 'Tag(s) deleted successfully.'
  end

  # Destroy a specific tag by ID
  def destroy
    PageTag.find_by(id: params[:id], user_id: current_user.id).destroy!

    return redirect_back fallback_location: root_path, notice: 'Tag(s) deleted successfully.'
  end
end
