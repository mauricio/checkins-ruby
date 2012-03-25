class CheckinsController < AuthenticatedController

  def create
    @checkin = current_user.checkins.create( params[:checkin] )

    if @checkin.save
      respond_with @checkin
    else
      render :json => @checkin.errors.full_messages, :status => 422
    end
  end

  def index
    @checkins = Checkin.all
    render :json => @checkins.map { |c| {
        :id => c.id,
        :comment => c.comment,
        :user => c.user,
        :resource => c.resource,
        :user_image => c.user_image
      }
    }
  end

end