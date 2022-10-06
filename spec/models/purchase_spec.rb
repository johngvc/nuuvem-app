require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it {
    is_expected.to validate_presence_of(:quantity).with_message('Purchases cannot have empty quantities!')
  }
end
