class Web::V1::ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  def index
    @services =  Service.where(published: true).page params[:page]
  end

  def show
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end
end
