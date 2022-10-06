require 'rchardet'
require 'acsv'

module SalesReport
  class Processor
    def process(sales_report)
      @sales_report = sales_report
      if @sales_report.blank?
        Rails.logger.error 'no sale report provided'
        return
      end

      begin
        parsed_file = ACSV::CSV.parse(@sales_report.file, headers: true)

        file_headers = parsed_file.headers

        unless (SalesReports::REQUIRED_SALES_REPORT_FILE_COLUMNS - file_headers).empty?
          raise 'report in invalid or incomplete format'
        end

        ActiveRecord::Base.transaction(joinable: false, requires_new: true) do
          parsed_file.each do |row|
            purchaser = Purchaser.find_or_create_by!(name: row['purchaser name'])
            merchant = Merchant.find_or_create_by!(address: row['merchant address'],
                                                   name: row['merchant name'])
            item = Item.find_or_create_by!(name: row['item description'], price: row['item price'],
                                           merchant: merchant)

            purchase = Purchase.new(purchaser: purchaser, sales_reports: @sales_report, item: item,
                                    quantity: row['purchase count'])

            purchase.save!
          end

          @sales_report.gross_sum = Purchase.joins(:sales_reports, :item)
                                            .where(sales_reports_id: @sales_report.id)
                                            .sum('purchases.quantity * items.price')
          @sales_report.processed = true
          @sales_report.last_error = nil
          @sales_report.save!
        end
      rescue StandardError => e
        @sales_report&.last_error = e&.message
        @sales_report&.save
      end
    end
  end
end
