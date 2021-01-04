class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.belongs_to :user
      t.belongs_to :brand
      t.belongs_to :model
      t.string :reference
      t.integer :year
      t.integer :scope
      t.integer :condition

      t.timestamps
    end
  end
end
