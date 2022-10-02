class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string  :name
      t.string  :tag
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
