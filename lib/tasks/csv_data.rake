require "csv"

namespace :seed do 
    task customers: :environment do
        file = File.join(Rails.root, "db/data/customers.csv")
        CSV.foreach(file, headers: true) do |r|
            Customer.create!(r.to_h)
        end
    end
end
