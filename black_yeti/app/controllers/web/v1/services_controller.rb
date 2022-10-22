# frozen_string_literal: true

module Web
  module V1
    class ServicesController < WebsController
      before_action :set_service, only: [:show]

      def index
        record = if params[:search].present?
                   Service.published.search(params[:search]).records
                 else
                   Service.published
                 end

        @services =  record.page params[:page]
      end

      def show; end

      private

      def set_service
        @service = Service.find(params[:id])
      end
    end
  end
end
