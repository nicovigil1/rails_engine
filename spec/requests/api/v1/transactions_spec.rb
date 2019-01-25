require "rails_helper"

describe "transaction api" do
    it 'can return all of the transactions as json' do 
        customer = create(:customer)
        merchant = create(:merchant)
        invoice = create(:invoice, merchant:merchant, customer:customer)
        transaction1, transaction2 = create_list(:transaction, 2, invoice: invoice)

        get "/api/v1/transactions"

        expect(response).to be_successful
        expect(JSON.parse(response.body).count).to eq(2) 
    end 

    it 'can return a single transaction as json' do 
        customer = create(:customer)
        merchant = create(:merchant)
        invoice = create(:invoice, merchant:merchant, customer:customer)
        transaction = create(:transaction, invoice: invoice)

        get "/api/v1/transactions/#{transaction.id}"

        expect(response).to be_successful 
        expect(JSON.parse(response.body)["id"]).to eq(transaction.id)
    end 
end