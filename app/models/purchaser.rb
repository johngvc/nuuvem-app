# == Schema Information
#
# Table name: purchasers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Purchaser < ApplicationRecord
  has_many :purchases

  validates :name, presence: { message: 'Purchaser name cannot be blank!' }
end
