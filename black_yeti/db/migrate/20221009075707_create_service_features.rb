class CreateServiceFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :service_features do |t|
      t.string  :name
      t.text  :description
      t.boolean :published, default: false
      t.references :service
      t.timestamps
    end
  end
end
