class Api::AuthenticatedApiController < Api::ApiController
  before_action :authenticate_user

  def authenticate_user
    resource = User.find_by(token: params['body']['token'])
    render json: { data: 'Not Authenticated, You Should Sign In.' }, status: 401 if resource.nil?
    return if resource.nil?
    @user =  resource
  end
end
