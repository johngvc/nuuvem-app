ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  action_item :view_site do
    link_to 'Submit new sale report', new_admin_sales_report_path
  end

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end

    columns do
      column do
        panel I18n.t('active_admin.sales') do
          para("#{I18n.t('active_admin.total_gross_income')}: #{Purchase.total_gross_income}")
        end

        # TODO: Remove query from here, fix order of reports shown
        panel I18n.t('active_admin.sales_reports_history') do
          table_for sales_reports do
            column :file_name
            column :gross_sum
            column :last_error
            column :processed
            column :updated_at
          end
        end
      end
    end
  end

  controller do
    helper_method :sales_reports

    private

    def sales_reports
      SalesReports.all.order(updated_at: :desc).first(10)
    end
  end
end
