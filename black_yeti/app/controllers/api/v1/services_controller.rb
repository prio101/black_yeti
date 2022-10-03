# frozen_string_literal: true

module Api
  module V1
    class ServicesController < Api::ApiController
      def index
        collection = Service.page(params[:page]).per((params[:per_page] || Service::DEFAULTS_PER_PAGE).to_i)
        result = paginate(collection)
        render json: result.to_json, status: :ok
      end

      def show
        result = Service.find_by(id: params[:id]) || no_data
        render json: result.to_json, status: :ok
      end
    end
  end
end
