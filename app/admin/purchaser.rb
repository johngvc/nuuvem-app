ActiveAdmin.register Purchaser do
  permit_params :name, :item, :quantity, :sales_reports, :created_at

  actions :all

  index do
    selectable_column
    id_column
    column :name
    column :created_at

    actions
  end

  filter :name
  filter :created_at

  show do
    tabs do
      tab I18n.t('active_admin.overview') do
        panel I18n.t('active_admin.general') do
          attributes_table_for purchaser do
            row :id
            row :name
            row :created_at
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
        f.input :name
    end

    actions
  end
end
