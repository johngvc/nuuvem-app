# == Schema Information
#
# Table name: purchases
#
#  id           :bigint           not null, primary key
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :bigint           not null, indexed
#  purchaser_id :bigint           not null, indexed
#
# Indexes
#
#  index_purchases_on_item_id       (item_id)
#  index_purchases_on_purchaser_id  (purchaser_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (purchaser_id => purchasers.id)
#
FactoryBot.define do
  factory :purchase do
    purchaser { nil }
    item { nil }
    quantity { 1 }
  end
end
