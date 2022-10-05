require 'rails_helper'

RSpec.describe SalesReport::Processor do
  describe '.process' do
    context 'with a valid file' do
      it 'process the file and log the gross sum on SalesReports record' do
        # sales_report = FactoryBot.create(:sales_report)
        sales_report = SalesReports.create(file: File.read("spec/fixtures/sales_reports_correct.tab"), file_name: "sales_reports_correct.tab")
        sales_report.process
        expect(sales_report.gross_sum).to eq(102.95)
      end
    end

    context 'with a file with wrong columns' do
      it 'process the file and stores the error' do
        sales_report = create(:sales_report, :wrong_columns)
        sales_report.process
        expect(sales_report.last_error).not_to be_nil
      end
    end

    context 'with a file with empty data' do
      it 'process the file and stores the error' do
        sales_report = create(:sales_report, :empty_data)
        sales_report.process
        expect(sales_report).not_to be_nil
      end
    end
  end

end
