# frozen_string_literal: true

module Api
  module V1
    class ServicesController < Api::ApiController
      def index
        default_per_page = 10
        collection = Service.page(params[:page]).per((params[:per_page] || default_per_page).to_i)
        result = paginate(collection)
        render json: result.to_json, status: :ok
      end
    end
  end
end
