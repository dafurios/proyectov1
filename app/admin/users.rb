ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :role, :name, :lastname, :email, :password, :image, :school

  index do
    selectable_column
    id_column
    column :image do |user|
      image_tag user.image.thumb
    end
    column :role
    column :school
    column :rut
    column :email
    column :name
    column :lastname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :member_since do |user|
      time_ago_in_words(user.created_at)
    end
    column :last_log_in do |user|
      user.last_sign_in_at.present? ? #esto es igual a un if
      time_ago_in_words(user.last_sign_in_at) : 'Never'
    end
    actions
  end
  filter :rut
  filter :email, as: :select
  filter :name
  filter :lastname, as: :select
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Agregar un nuevo usuario :::: Check si sera Admin' do
      f.input :role
      f.input :image
      # f.input :rut
      f.input :name
      f.input :lastname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      if (params[:user][:password].blank? && params[:user] [:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
