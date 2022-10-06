require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { is_expected.to validate_presence_of(:name).with_message("Merchant name cannot be blank!") }
end
