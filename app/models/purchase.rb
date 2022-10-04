# == Schema Information
#
# Table name: purchases
#
#  id               :bigint           not null, primary key
#  quantity         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_id          :bigint           not null, indexed
#  purchaser_id     :bigint           not null, indexed
#  sales_reports_id :bigint           not null, indexed
#
# Indexes
#
#  index_purchases_on_item_id           (item_id)
#  index_purchases_on_purchaser_id      (purchaser_id)
#  index_purchases_on_sales_reports_id  (sales_reports_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (purchaser_id => purchasers.id)
#  fk_rails_...  (sales_reports_id => sales_reports.id)
#
class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :sales_reports
  belongs_to :item

  # Purchase.includes(:items).references(:items).sum('items.price * purchases.quantity')

  def self.total_gross_income
    Purchase.joins(:item).sum('items.price * purchases.quantity')
  end
end
