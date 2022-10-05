# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  name        :string
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :bigint           not null, indexed
#
# Indexes
#
#  index_items_on_merchant_id  (merchant_id)
#
# Foreign Keys
#
#  fk_rails_...  (merchant_id => merchants.id)
#
FactoryBot.define do
  factory :item do
    name { 'TestItem' }
    price { 1.5 }
    merchant { create(:merchant) }
  end
end
