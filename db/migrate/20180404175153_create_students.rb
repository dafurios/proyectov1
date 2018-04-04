class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :image
      t.string :rut
      t.string :name
      t.string :lastname
      t.string :surname
      t.string :address
      t.string :commune
      t.string :state
      t.string :city
      t.string :country
      t.string :phone
      t.string :school
      t.string :level
      t.string :course
      t.references :user, foreign_key: true
      t.references :commune, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
