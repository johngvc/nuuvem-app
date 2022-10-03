ActiveAdmin.register SalesReports do
  permit_params :sales_report

  config.filters = false

  index do
    column :file_name

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
    end
  end

  controller do

    def create
      sales_report_params = permitted_params[:sales_reports]

      @sales_report = SalesReports.create()

      @sales_report[:file_name] = sales_report_params[:sales_report].original_filename
      @sales_report[:file] = sales_report_params[:sales_report].read

      if @sales_report.save
        redirect_to admin_sales_report_path(@sales_report)
      else
        render :new
      end
    end

    def update
      sales_report_params = permitted_params[:sales_reports]

      @sales_report = SalesReports.where(id: params[:id]).first!

      @sales_report[:file_name] = sales_report_params[:sales_report].original_filename
      @sales_report[:file] = sales_report_params[:sales_report].read

      if @sales_report.save
        redirect_to admin_sales_report_path(@sales_report)
      else
        render :edit
      end
    end
  end
end
