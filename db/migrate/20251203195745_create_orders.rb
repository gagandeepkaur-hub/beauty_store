class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total, precision: 8, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
