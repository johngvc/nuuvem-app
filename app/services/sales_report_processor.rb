require 'rchardet'
require 'acsv'

class SalesReportProcessor
    def self.process(sales_report)
        raise "no sale report provided" if sales_report.nil?
        Purchase.where(sales_reports: sales_report).delete_all

        ACSV::CSV.parse(sales_report.file, headers: true).each do |row|
            purchaser = Purchaser.find_or_create_by(name: row["purchaser name"])
            merchant = Merchant.find_or_create_by(address: row["merchant address"],name: row["merchant name"])
            item = Item.find_or_create_by(name: row["item description"], price: row["item price"], merchant: merchant)

            purchase = Purchase.new()
            purchase.purchaser = purchaser
            purchase.sales_reports = sales_report
            purchase.item = item
            purchase.quantity = row["purchase count"]

            purchase.save!
          end
        sales_report.gross_sum = Purchase.joins(:sales_reports, :item).where(sales_reports_id: sales_report.id).sum('purchases.quantity * items.price')
        sales_report.processed = true
        sales_report.last_error = nil
        sales_report.save!
    rescue => error
        sales_report.last_error = error&.message
        sales_report.save
    end

end