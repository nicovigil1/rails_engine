require "csv"

namespace :seed do 
    task customers: :environment do
        file = File.join(Rails.root, "db/data/customers.csv")
        CSV.foreach(file, headers: true) do |r|
            Customer.create!(r.to_h)
        end
    end

    task invoices: :enviornment do
        file = File.join(Rails.root, "db/data/invoices.csv")
        CSV.foreach(file, headers:true) do |r|
            Invoice.create!(r.to_h)
        end
    end 

    task invoice_items: :envoirnment do 
        file = File.join(Rails.root, "db/data/invoice_items.csv")
        CSV.foreach(file, headers:true) do |r|
            Invoice_items.create!(r.to_h)
        end 
    end

    task items: :envoirnment do
        file = File.join(Rails.root, 'db/data/items.csv')
        CSV.foreach(file, headers: true) do |r| 
            Item.create(r.to_h)
        end 
    end

    task merchants: :enviornment do
        file = File.join(Rails.root, "db/data/merchants.csv")
        CSV.foreach(file, headers: true) do |row|
            Merchant.create!(row.to_h)
        end 
    end 

    task transactions: :enviornment do 
        file = File.join(Rails.root, "db/data/transactions.csv")
        CSV.foreach(file, headers: true) do |r|
            Transaction.create!(r.to_h)
        end
    end
end

