class AddAtributosToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :surname, :string
    add_column :users, :rut, :string
    add_column :users, :relationship, :string
    add_column :users, :r_legal, :string
    add_column :users, :rut_legal, :string
    add_column :users, :giro, :string
    add_column :users, :phone, :string
    add_column :users, :school, :string
    add_column :users, :level, :string
    add_column :users, :course, :string
    add_column :users, :coordinator, :string
    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :commune, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :work_child, :boolean, default: false
    add_column :users, :role, :integer, default: 0
    add_column :users, :driver, :string
    add_column :users, :type_driver_license, :string
    add_column :users, :info_emergency, :string
    add_column :users, :type, :string
  end
end
