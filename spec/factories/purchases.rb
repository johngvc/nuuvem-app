FactoryBot.define do
  factory :purchase do
    purchaser { nil }
    item { nil }
    quantity { 1 }
  end
end
