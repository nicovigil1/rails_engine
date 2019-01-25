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
        expect(JSON.parse(response.body).count).to eq(2)
    end 

    it 'can return a single invoices as json' do 
        merchant = create(:merchant, id:12345)
        customer = create(:customer, id:123)
        invoice = create(:invoice, merchant:merchant, customer: customer)

        get "/api/v1/invoices/#{invoice.id}"
        expect(response).to be_successful
        expect(JSON.parse(response.body)["merchant_id"]).to eq(merchant.id)
    end 
end
