# frozen_string_literal: true

module Api
  module V1
    class ServicesController < Api::ApiController
      before_action :set_serivce, only: %i[:show, :delete, :update]

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
          # check and test
          render json: error_saving_data(service.errors), status: 401
        end
      end

      def update
        service = Service.find_by(name: service_params['name'])
        service.name = service_params['name']
        service.tag = service_params['tag']
        service.description = service_params['description']
        service.published = service_params['published']
        if service.save!
          render json: @service , status: :ok
        end
      end

      def delete
        if @service.delete
          render json: { data: 'Record Deleted Successfully' }, status: :ok
        else
          render json: { data: 'Record Could not be deleted' }, status: 401
        end
      end

      private

      def set_serivce
        @service = Service.find_by(id: params[:id])
      end

      def service_params
        params['data']['service']
      end
    end
  end
end
