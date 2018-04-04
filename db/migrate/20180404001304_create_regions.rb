class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :short_name
      t.string :name
      t.string :code
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
