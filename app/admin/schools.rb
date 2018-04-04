ActiveAdmin.register School do
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
permit_params :name, :r_legal, :rut_legal, :address, :rbd, :commune

index do
  selectable_column
  id_column
  column :name
  column :r_legal
  column :rut_legal
  column :address
  # column :commune
  column :rbd
  column :created_at
  actions
end
filter :rut
filter :name
filter :created_at

form do |f|
  f.inputs 'Agregar un nuevo Colegio :::: Check si sera Admin' do
    f.input :name
    f.input :r_legal
    f.input :rut_legal
    f.input :address
    f.input :rbd
    # f.input :commune
  end
  f.actions
end

end
