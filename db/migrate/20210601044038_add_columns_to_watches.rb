class AddColumnsToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :temp_first_name, :string, null: true
    add_column :watches, :temp_email, :string, null: true
    add_column :watches, :temp_phone, :string, null: true
  end
end
