ActiveAdmin.register Purchase do
  permit_params :purchaser, :item, :quantity, :sales_reports, :created_at

  actions :all

  index do
    selectable_column
    id_column
    column :purchaser
    column :item
    column :quantity
    column :sales_reports
    column :created_at

    actions
  end

  filter :purchaser
  filter :item
  filter :quantity
  filter :sales_reports
  filter :created_at

  show do
    tabs do
      tab I18n.t('active_admin.overview') do
        panel I18n.t('active_admin.general') do
          attributes_table_for purchases do
            row :id
            row :purchaser
            row :item
            row :quantity
            row :sales_reports
            row :created_at
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :purchaser
      f.input :item
      f.input :quantity
      f.input :sales_reports
      f.input :created_at
    end

    actions
  end
end
