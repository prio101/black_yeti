class Api::V1::ServicesController < Api::ApiController
  def index
    services = Service.all
    render json: services.to_json, status: :ok
  end
end
