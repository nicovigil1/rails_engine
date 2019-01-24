class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates_presence_of :quantity, message: "can't be blank"
  validates_presence_of :unit_price, message: "can't be blank"
end
