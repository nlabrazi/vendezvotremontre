class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.belongs_to :user
      t.belongs_to :brand
      t.belongs_to :model
      t.belongs_to :scope
      t.belongs_to :condition
      t.string :reference
      t.integer :year

      t.timestamps
    end
  end
end
