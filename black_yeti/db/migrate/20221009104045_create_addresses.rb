class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string  :street_no
      t.string  :house_no
      t.string  :zipcode
      t.text    :notes
      t.references  :user
      t.timestamps
    end
  end
end
