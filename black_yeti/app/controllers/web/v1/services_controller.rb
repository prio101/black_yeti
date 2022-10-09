class Web::V1::ServicesController < ApplicationController
  def index
    @services =  Service.where(published: true).page params[:page]
  end
end
