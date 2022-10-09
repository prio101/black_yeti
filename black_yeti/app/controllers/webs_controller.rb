class WebsController < ApplicationController
  before_action :set_user

  def set_user
    @user = User.first
  end

  def current_user
    @user
  end
end
