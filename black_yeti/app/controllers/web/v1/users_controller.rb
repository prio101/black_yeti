class Web::V1::UsersController < WebsController
  def index
    @user = current_user
  end
end
