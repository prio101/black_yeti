# frozen_string_literal: true

class Service < ApplicationRecord
  paginates_per 10

  DEFAULTS_PER_PAGE = 10

  has_many :service_features
  has_many  :bookings
end
