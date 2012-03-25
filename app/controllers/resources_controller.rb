class ResourcesController < ApiController

  def index
    @resources = if params[:q].blank?
                   Resource.all
                 else
                   Resource.where( [ "name LIKE ?", "%#{params[:q]}%" ] ).all
                 end

    respond_with @resources
  end

end