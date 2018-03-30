class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.integer :user_id
      t.integer :line_item_id

      t.timestamps null: false
    end
  end
end
