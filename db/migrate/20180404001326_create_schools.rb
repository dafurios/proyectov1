class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :r_legal
      t.string :rut_legal
      t.string :address
      t.string :rbd
      t.references :commune, foreign_key: true

      t.timestamps
    end
  end
end
