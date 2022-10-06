# frozen_string_literal: true

module Api
  module V1
    class ServicesController < Api::ApiController
      before_action :set_serivce, only: [:show, :delete, :update]

      def index
        collection = Service.page(params[:page]).per((params[:per_page] || Service::DEFAULTS_PER_PAGE).to_i)
        result = paginate(collection)
        render json: result.to_json, status: :ok
      end

      def show
        result = @service || no_data
        render json: result.to_json, status: :ok
      end

      def create
        service = Service.new
        service.name = service_params['name']
        service.tag = service_params['tag']
        service.description = service_params['description']
        service.published = service_params['published']

        if service.save!
          render json: service, status: :created
        else
          render json: error_saving_data(service.errors), status: 401
        end
      end

      def update
        @service.name = service_params['name']
        @service.description = service_params['description']
        @service.tag = service_params['tag']
        @service.published = service_params['published']

        if @service.save!
          render json: @service , status: :ok
        else
          render json: data_operation_not_success, status: 404
        end
      end

      def delete
        if @service.delete
          render json: data_deleted, status: :ok
        else
          render json: data_operation_not_success, status: 401
        end
      end

      private

      def set_serivce
        @service = Service.find(params[:id])
      end

      def service_params
        params['data']['service']
      end
    end
  end
end
