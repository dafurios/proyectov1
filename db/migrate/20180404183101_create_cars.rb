class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :type_car
      t.string :brand
      t.string :model
      t.string :year
      t.string :color
      t.string :plate
      t.boolean :tech_rev,  default: false
      t.boolean :nation_registry,  default: false
      t.string :school
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
