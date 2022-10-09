class AddPriceToSerivesTable < ActiveRecord::Migration[7.0]
  def change
    add_column  :services, :price, :decimal, default: 0.0
    add_column  :services, :selling_price, :decimal, default: 0.0
  end
end
