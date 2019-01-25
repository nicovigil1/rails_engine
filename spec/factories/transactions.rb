FactoryBot.define do
  factory :transaction do
    credit_card_number { "1234567812345678" }
    credit_card_expiration_date { "MyString" }
    result { 1 }
  end
end
