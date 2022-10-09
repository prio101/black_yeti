# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  has_many  :payments
  belongs_to  :service

  paginates_per 10
end
