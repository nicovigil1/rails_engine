require "csv"

namespace :seed do 
    task customers: :environment do
        file = File.join(Rails.root, "db/data/customers.csv")
        CSV.foreach(file, headers: true) do |r|
            Customer.create!(r.to_h)
        end
    end

    task invoices: :environment do
        file = File.join(Rails.root, "db/data/invoices.csv")
        CSV.foreach(file, headers:true) do |r|
            Invoice.create!(r.to_h)
        end
    end 

    task invoice_items: :environment do 
        file = File.join(Rails.root, "db/data/invoice_items.csv")
        CSV.foreach(file, headers:true) do |r|
            InvoiceItem.create!(r.to_h)
        end 
    end

    task items: :environment do
        file = File.join(Rails.root, 'db/data/items.csv')
        CSV.foreach(file, headers: true) do |r| 
            Item.create!(r.to_h)
        end 
    end

    task merchants: :environment do
        file = File.join(Rails.root, "db/data/merchants.csv")
        CSV.foreach(file, headers: true) do |row|
            Merchant.create!(row.to_h)
        end 
    end 

    task transactions: :environment do 
        file = File.join(Rails.root, "db/data/transactions.csv")
        CSV.foreach(file, headers: true) do |r|
            Transaction.create!(r.to_h)
        end
    end

    task all: :environment do 
        Rake::Task["seed:merchants"].invoke
        Rake::Task["seed:customers"].invoke
        Rake::Task["seed:invoices"].invoke
        Rake::Task["seed:items"].invoke
        Rake::Task["seed:invoice_items"].invoke
        Rake::Task["seed:transactions"].invoke
    end 
end

