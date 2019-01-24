class Merchant < ApplicationRecord
    has_many :invoices
    has_many :items 

    validates_presence_of :name, message: "can't be blank"
end
