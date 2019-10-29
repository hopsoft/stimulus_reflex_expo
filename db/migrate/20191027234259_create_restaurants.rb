class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.integer :stars, null: false, default: 0
      t.integer :price, null: false, default: 1
      t.string :category, null: false

      t.timestamps
    end
  end
end
