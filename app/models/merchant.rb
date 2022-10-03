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
class Merchant < ApplicationRecord
    has_many :items
end
