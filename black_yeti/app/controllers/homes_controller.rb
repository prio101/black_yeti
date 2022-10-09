# frozen_string_literal: true

class HomesController < WebsController
  def index
    @services = Service.where(published: true).last(4)
  end
end
