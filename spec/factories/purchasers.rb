# == Schema Information
#
# Table name: purchasers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :purchaser do
    name { "MyString" }
  end
end
