class UserController < ApiController

  skip_filter :authenticate_user!, :only => :create
  before_filter :authenticate_user!, :only => :show

  def show
    respond_with current_user
  end

  def create
    params[:user][:password_confirmation] = params[:user][:password]
    user = User.new(params[:user])

    if user.save
      respond_with user
    else
      warden.custom_failure!
      render :json => user.errors.full_messages, :status => 422
    end
  end

end