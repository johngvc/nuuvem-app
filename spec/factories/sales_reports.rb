FactoryBot.define do
  factory :sales_report do
    file { File.read('spec/fixtures/sales_reports_correct.tab') }

    trait :wrong_columns do
      file { File.read('spec/fixtures/sales_reports_wrong_columns.tab') }
    end

    trait :empty_data do
      file { File.read('spec/fixtures/sales_reports_empty_data.tab') }
    end
  end
end
