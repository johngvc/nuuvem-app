# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :merchant do
    name { "MyString" }
    address { "MyString" }
  end
end
