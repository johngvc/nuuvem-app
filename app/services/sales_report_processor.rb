require 'rchardet'
require 'acsv'

class SalesReportProcessor
    def process(sales_report)
        raise "no sale report provided" if sales_report.nil?

        ACSV::CSV.parse(sales_report.file, headers: true).each do |row|
            purchaser = Purchaser.find_or_create_by(name: row["purchaser name"])
            merchant = Merchant.find_or_create_by(address: row["merchant address"],name: row["merchant name"])
            item = Item.find_or_create_by(name: row["item description"], price: row["item price"], merchant: merchant)

            purchase = Purchase.new()
            purchase.purchaser = purchaser
            purchase.item = item
            purchase.quantity = row["purchase count"]

            purchase.save
          end

    end

end