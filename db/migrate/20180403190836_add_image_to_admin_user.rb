class AddImageToAdminUser < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :image, :string
  end
end
