class Api::V1::UsersController < Api::AuthenticatedApiController
  def index
    @user
  end

  def update
  end

  def disable_subscription
    DisableSubscriptionJob.perform_now(@user)
    redirect_to web_v1_user_path(@user), notice: 'You are unsubscribed form the newsletter.'
  end
end
