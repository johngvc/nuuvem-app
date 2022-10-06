require 'rails_helper'

RSpec.describe SalesReports, type: :model do
  it { is_expected.to validate_presence_of(:file).with_message('File cannot be empty!') }
  it { is_expected.to validate_presence_of(:file_name).with_message('File name cannot be empty!') }

  it 'returns a validation error in case of wrong file format is used' do
    sales_report = build(:sales_reports, :wrong_file_type)
    sales_report.valid?
    expect(sales_report.errors.full_messages.first).to eq('File Invalid file format.')
  end
end
