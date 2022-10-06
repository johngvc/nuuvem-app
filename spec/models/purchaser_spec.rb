require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  it { is_expected.to validate_presence_of(:name).with_message("Purchaser name cannot be blank!") }
end
