class AddCommuneToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :commune, foreign_key: true
  end
end
