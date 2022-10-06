FactoryBot.define do
  factory :sales_reports do
    file { File.read('spec/fixtures/sales_reports_correct.tab') }
    file_name { "sales_reports_correct.tab" }

    trait :wrong_columns do
      file { File.read('spec/fixtures/sales_reports_wrong_columns.tab') }
      file_name { "sales_reports_wrong_columns.tab" }
    end

    trait :empty_data do
      file { File.read('spec/fixtures/sales_reports_empty_data.tab') }
      file_name { "sales_reports_empty_data.tab" }
    end

    trait :wrong_file_type do
      file { File.read('spec/fixtures/sales_reports_wrong_file_extension.jpg') }
      file_name { "sales_reports_wrong_file_extension.jpg" }
    end

    trait :empty_report do
      file { nil }
      file_name nil
    end
  end
end
