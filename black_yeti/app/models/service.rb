# frozen_string_literal: true

class Service < ApplicationRecord
  include Searchable

  paginates_per 10

  DEFAULTS_PER_PAGE = 10

  has_many :service_features
  has_many :bookings

  enum :popularity_choice, { latest: 0, popular: 1, regular: 2 }

  scope :published, -> { where(published: true) }

  def self.services_by_popularity choice
    case choice
    when 0
      where('created_at >=? AND published = ?', 3.days.before, true)
    when 1
      where('created_at >= ? AND published = ?', 30.days.before, true)
    when 2
      where('created_at >= ? AND published = ?', 60.days.before, true)
    else
      published
    end
  end
end
