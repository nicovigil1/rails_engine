class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, message: "can't be blank"
  # validates_presence_of :credit_card_expiration_date, message: "can't be blank"
  validates_presence_of :result, message: "can't be blank"
end
