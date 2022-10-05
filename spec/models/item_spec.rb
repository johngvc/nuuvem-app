require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:price) }
  it { is_expected.to validate_presence_of(:price) }
end
