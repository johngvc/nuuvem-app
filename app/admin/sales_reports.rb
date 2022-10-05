ActiveAdmin.register SalesReports do
  permit_params :sales_report

  config.filters = false

  index do
    id_column
    column :file_name
    column :gross_sum
    column :last_error
    column :processed

    column :updated_at
    actions
  end

  form do |f|
    f.inputs "File" do
      f.input :sales_report, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :file_name
      row :gross_sum
      row :last_error
      row :processed
      row :updated_at
    end
  end

  controller do

    def create
      sales_report_params = permitted_params[:sales_reports]

      @sales_report = SalesReports.create()

      @sales_report[:file_name] = sales_report_params[:sales_report].original_filename
      @sales_report[:file] = sales_report_params[:sales_report].read

      if @sales_report.save
        @sales_report.process
        redirect_to admin_dashboard_path(@sales_report), notice: "Sale report successfully created!"
      else
        redirect_to new_admin_sales_report_path, :flash => { :error => "Sale report update failed. #{@sales_report.errors[:file].first}" }
      end
    end

    def update
      sales_report_params = permitted_params[:sales_reports]

      @sales_report = SalesReports.where(id: params[:id]).first!

      @sales_report[:file_name] = sales_report_params[:sales_report].original_filename
      @sales_report[:file] = sales_report_params[:sales_report].read

      if @sales_report.save
        @sales_report.process
        redirect_to admin_dashboard_path(@sales_report), notice: "Sale report successfully updated!"
      else
        redirect_to edit_admin_sales_report_path, :flash => { :error => "Sale report update failed. #{@sales_report.errors[:file].first}" }
      end
    end
  end
end
