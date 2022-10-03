# == Schema Information
#
# Table name: sales_reports
#
#  id         :bigint           not null, primary key
#  file       :binary
#  file_name  :string
#  last_error :string
#  processed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SalesReports < ApplicationRecord

    after_create do
        
    end

end
