ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :image

  index do
    selectable_column
    id_column
    column :image do |admin_user|
      image_tag admin_user.image.thumb
    end
    column :rut
    column :email
    column :name
    column :lastname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :image
  filter :rut
  filter :email
  filter :name
  filter :lastname
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at


  form do |f|
    f.inputs 'Agregar un nuevo Admin ::: Seguir protocolo' do
      f.input :image
      # f.input :rut
      # f.input :name
      # f.input :lastname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      if (params[:admin_user][:password].blank? && params[:admin_user] [:password_confirmation].blank?)
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end
  end
end
