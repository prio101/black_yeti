# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  has_many  :payments
end
