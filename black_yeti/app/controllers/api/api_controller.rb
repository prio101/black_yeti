# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    protect_from_forgery  with: :null_session
    include Paginator
    include ApiMessages
  end
end
