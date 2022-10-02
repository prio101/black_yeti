# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    # look into null session
    # protect_from_forgery: :with_null_session
    include Paginator
  end
end
