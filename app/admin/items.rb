ActiveAdmin.register Item do
  permit_params :name, :price, :merchant

  actions :all

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :merchant
    column :created_at

    actions
  end

  filter :name
  filter :price
  filter :merchant
  filter :created_at

  show do
    tabs do
      tab I18n.t('active_admin.overview') do
        panel I18n.t('active_admin.general') do
          attributes_table_for item do
            row :id
            row :name
            row :price
            row :merchant
            row :creeated_at
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :merchant
    end

    actions
  end
end
