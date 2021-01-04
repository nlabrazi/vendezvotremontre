class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :is_admin, :boolean, default: false, null: false
    add_column :users, :is_seller, :boolean, default: false, null: false
    add_column :users, :is_buyer, :boolean, default: false, null: false
    add_column :users, :is_expert, :boolean, default: false, null: false
  end
end
