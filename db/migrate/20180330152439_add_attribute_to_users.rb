class AddAttributeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :current_cart_id, :integer
  end
end
