require "rails_helper"

describe "invoice api" do
    it 'can return all of the invoices as json' do 
        merchant = create(:merchant, id:12345)
        merchant2 = create(:merchant, id:789)
        customer = create(:customer, id:123)
        invoice1 = create(:invoice, merchant:merchant, customer: customer)
        invoice2 = create(:invoice, merchant:merchant2, customer: customer)

        get '/api/v1/invoices'

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"].count).to eq(2)
    end 

    it 'can return a single invoices as json' do 
        merchant = create(:merchant, id:12345)
        customer = create(:customer, id:123)
        invoice = create(:invoice, merchant:merchant, customer: customer)

        get "/api/v1/invoices/#{invoice.id}"
        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"]["attributes"]["status"]).to eq(invoice.status)
    end

    describe 'can find one or all customers by the attributes:' do
        it 'id' do 
            merchant = create(:merchant, id:123)
            customer = create(:customer, id:123)
            invoice = create(:invoice, merchant:merchant, customer: customer)

            get "/api/v1/invoices/find?id=#{invoice.id}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(invoice.id.to_s)
        end
        it 'status' do 
            merchant = create(:merchant, id:123)
            customer = create(:customer, id:123)
            invoice = create(:invoice, customer: customer, merchant:merchant)
            invoice1 = create(:invoice, customer: customer, merchant:merchant)

            get "/api/v1/invoices/find?id=#{invoice.id}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(invoice.id.to_s)

            get "/api/v1/invoices/find_all?status=#{invoice.status}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
    end
end
