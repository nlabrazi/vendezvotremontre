class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name
      t.belongs_to :brand

      t.timestamps
    end
  end
end
