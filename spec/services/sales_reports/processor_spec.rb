require 'rails_helper'

RSpec.describe SalesReport::Processor do
  subject { described_class.new.process(sales_report) }

  let(:sales_report) { create(:sales_reports) }

  before { subject }

  describe '.process' do
    context 'with a valid file' do
      it 'process the file and log the gross sum on SalesReports record' do
        expect(sales_report.reload.gross_sum).to eq(102.95)
      end
    end

    context 'with a file with wrong columns' do
      let(:sales_report) { create(:sales_reports, :wrong_columns) }

      it 'process the file and stores the error' do
        expect(sales_report.reload.last_error).not_to be_nil
      end
    end

    context 'with a file with empty data' do
      let(:sales_report) { create(:sales_reports, :empty_data) }

      it 'process the file and stores the error' do
        expect(sales_report).not_to be_nil
      end
    end
  end
end
