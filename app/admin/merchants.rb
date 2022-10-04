ActiveAdmin.register Merchant do
  permit_params :name, :address

  actions :all

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :created_at

    actions
  end

  filter :name
  filter :address
  filter :created_at

  show do
    tabs do
      tab I18n.t('active_admin.overview') do
        panel I18n.t('active_admin.general') do
          attributes_table_for merchant do
            row :id
            row :name
            row :address
            row :created_at
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
        f.input :name
        f.input :address
    end

    actions
  end
end
