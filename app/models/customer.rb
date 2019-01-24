class Customer < ApplicationRecord
    has_many :invoices
    validates_presence_of :first_name, message: "can't be blank"
    validates_presence_of :last_name, message: "can't be blank"
end
