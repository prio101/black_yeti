# frozen_string_literal: true

module Paginator
  def paginate(collection, _default_per_page = 10)
    current = collection.current_page
    per_page = collection.limit_value
    [{
      pagination: {
        current:,
        previous: (current > 1 ? (current - 1) : nil),
        next: current == collection.total_pages ? nil : (current + 1),
        total_pages: collection.total_pages,
        per_page:,
        count: Service.count
      },
      collection:
    }]
  end
end
