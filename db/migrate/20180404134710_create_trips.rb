class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :student
      t.string :car
      t.string :driver
      t.float :start_longitude
      t.float :start_latitude
      t.float :end_longitude
      t.float :end_latitude
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
