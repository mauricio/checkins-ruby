class AuthenticatedController < ApiController

  before_filter :authenticate_user!

end