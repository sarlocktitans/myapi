ActiveAdmin.register Car do
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
   permit_params :name, :price, :location, :is_featured, 
    							  :image, :model, :registration_date,
							       :description, :manufacturer
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :is_featured
    column :image
    column :model
    column :registration_date
    column :manufacturer
    actions
  end
end
