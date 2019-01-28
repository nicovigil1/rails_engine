require "rails_helper"

describe "Customer API" do
    it 'can return a list of all customers as json' do 
        create_list(:customer, 3)

        get '/api/v1/customers'

        expect(response).to be_successful 
        the_expected = JSON.parse(response.body)["data"].count 
        expect(the_expected).to eq(3)
    end 

    it 'can return a single customer as json' do 
        customer = create(:customer, id: 1)

        get '/api/v1/customers/1'

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"]["attributes"]["first_name"]).to eq(customer.first_name) 
    end

    describe "relationships" do
        it "for invoices" do
            customer = create(:customer)
            customer2 = create(:customer)
            merchant = create(:merchant)
            merchant2 = create(:merchant)
            invoice = create(:invoice, customer: customer, merchant: merchant)
            invoice2 = create(:invoice, customer: customer, merchant: merchant)
            invoice3 = create(:invoice, customer: customer2, merchant: merchant2)

            get  "/api/v1/customers/#{customer.id}/invoices"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
            expect(JSON.parse(response.body)["data"].last["id"]).to eq(invoice2.id.to_s)
        end
        it "for transactions" do
            customer = create(:customer)
            customer2 = create(:customer)
            merchant = create(:merchant)
            merchant2 = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            invoice2 = create(:invoice, merchant:merchant2, customer:customer2)
            transaction = create(:transaction, invoice: invoice)
            transaction2 = create(:transaction, invoice: invoice)
            transaction3 = create(:transaction, invoice: invoice2)

            get  "/api/v1/customers/#{customer.id}/transactions"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
            expect(JSON.parse(response.body)["data"].last["id"]).to eq(transaction2.id.to_s)
        end
    end 
end
