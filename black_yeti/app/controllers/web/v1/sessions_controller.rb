class Web::V1::SessionsController < ApplicationController

  def new
  end

  def create
    if params[:email].present? and params[:password].present?
      user = User.find_by(email: params[:email])&.authenticate(params[:password])
      if user.present?
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Signed In.'
      end
    end
  end

  def register
  end

  def create_registration
    byebug
    if params[:email].present? and params[:password].present? and params[:password_confirmation].present?
      return unless params[:password] == params[:password_confirmation]
      user = User.new
      ActiveRecord::Base.transaction do
        user.email = params[:email]
        user.password = params[:password]
        user.accept_newsletter = params[:accept_newsletter]
        user.save!
      end
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Registered User.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are logged out.'
  end
end
