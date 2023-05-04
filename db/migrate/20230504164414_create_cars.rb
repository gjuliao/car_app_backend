class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :image
      t.text :description
      t.decimal :price
      t.string :brand
      t.date :year
      t.string :color
      t.boolean :is_electric
      t.integer :accidents

      t.timestamps
    end
  end
end
