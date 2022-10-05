# == Schema Information
#
# Table name: sales_reports
#
#  id         :bigint           not null, primary key
#  file       :binary
#  file_name  :string
#  gross_sum  :float
#  last_error :string
#  processed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SalesReports < ApplicationRecord
    has_many :purchases

    validate :file_format, if: :file?
    validates :file, presence: { message: "File cannot be empty!"}

    REQUIRED_SALES_REPORT_FILE_COLUMNS = ["purchaser name", "item description", "item price", "purchase count", "merchant address", "merchant name"]

    def file_format
        unless valid_extension?(self.file_name)
        self.errors.add :file, "Invalid file format."
        end
    end

    def valid_extension?(filename)
        ext = File.extname(filename)
        %w( .tab .csv ).include? ext.downcase
    end

    def process
        SalesReportProcessor.process(self)
    end
end
