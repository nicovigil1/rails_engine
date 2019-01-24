class Item < ApplicationRecord
  belongs_to :merchant
  belongs_to :invoice_item
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name, message: "can't be blank"
  validates_presence_of :description, message: "can't be blank"
  validates_presence_of :unit_price, message: "can't be blank"
end
