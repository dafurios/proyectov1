class AddGeoPositionToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :latitude, :float
    add_column :students, :longitude, :float
  end
end
