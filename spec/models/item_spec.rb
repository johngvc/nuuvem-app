require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to validate_presence_of(:name).with_message("Item name cannot be blank!") }
  it { is_expected.to validate_numericality_of(:price).with_message("Price must be a number!") }
  it { is_expected.to validate_presence_of(:price).with_message("Item must have a price!") }
end
