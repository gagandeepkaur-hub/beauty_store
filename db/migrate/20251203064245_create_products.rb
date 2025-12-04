class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.string :category
      t.text :description
      t.boolean :on_sale
      t.boolean :new_arrival

      t.timestamps
    end
  end
end
