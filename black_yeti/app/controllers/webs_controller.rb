class WebsController < ApplicationController
  before_action :set_user

  def set_user
    return false if session[:user_id].nil?
    @user = User.find(session[:user_id])
  end

  def current_user
    @user ||= nil
  end
end
