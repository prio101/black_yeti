class AddPopularityTagToServicesTable < ActiveRecord::Migration[7.0]
  def change
    add_column  :services, :popularity_choice, :integer
  end
end
