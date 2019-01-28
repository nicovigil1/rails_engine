require "rails_helper"

describe "transaction api" do
    it 'can return all of the transactions as json' do 
        customer = create(:customer)
        merchant = create(:merchant)
        invoice = create(:invoice, merchant:merchant, customer:customer)
        transaction1, transaction2 = create_list(:transaction, 2, invoice: invoice)

        get "/api/v1/transactions"

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"].count).to eq(2) 
    end 

    it 'can return a single transaction as json' do 
        customer = create(:customer)
        merchant = create(:merchant)
        invoice = create(:invoice, merchant:merchant, customer:customer)
        transaction = create(:transaction, invoice: invoice)

        get "/api/v1/transactions/#{transaction.id}"

        expect(response).to be_successful 
        expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)
    end 

    describe 'can find all or one transactions by the attribute' do 
        it 'name' do 
            customer = create(:customer)
            merchant = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            transaction = create(:transaction, invoice: invoice)

            get "/api/v1/transactions/find?id=#{transaction.id}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)
        end
        it 'credit card number' do 
            customer = create(:customer)
            merchant = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            transaction = create(:transaction, invoice: invoice, credit_card_number: 1234123412341234)
            transaction1 = create(:transaction, invoice: invoice, credit_card_number: 1234123412341234)

            get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)

            get "/api/v1/transactions/find_all?credit_card_number=#{transaction.credit_card_number}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end
        it 'credit card exp_date' do 
            #fixme
            customer = create(:customer)
            merchant = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            transaction = create(:transaction, invoice: invoice, credit_card_expiration_date: 1234123412341234)
            transaction1 = create(:transaction, invoice: invoice, credit_card_expiration_date: 1234123412341234)

            get "/api/v1/transactions/find?credit_card_expiration_date=#{transaction.credit_card_expiration_date}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)

            get "/api/v1/transactions/find_all?credit_card_expiration_date=#{transaction.credit_card_expiration_date}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end
        it 'result' do 
            #fixme
            customer = create(:customer)
            merchant = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            transaction = create(:transaction, invoice: invoice, result: "success")
            transaction1 = create(:transaction, invoice: invoice, result: "success")

            get "/api/v1/transactions/find?result=#{transaction.result}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)

            get "/api/v1/transactions/find_all?result=#{transaction.result}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end
        it 'created_at' do 
            #fixme
            customer = create(:customer)
            merchant = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            transaction = create(:transaction, invoice: invoice, created_at: "2019-01-24 12:00:00 UTC")
            transaction1 = create(:transaction, invoice: invoice, created_at: "2019-01-24 12:00:00 UTC")

            get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)

            get "/api/v1/transactions/find_all?created_at=#{transaction.created_at}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end
        it 'updated_at' do 
            #fixme
            customer = create(:customer)
            merchant = create(:merchant)
            invoice = create(:invoice, merchant:merchant, customer:customer)
            transaction = create(:transaction, invoice: invoice, updated_at: "2019-01-24 12:00:00 UTC")
            transaction1 = create(:transaction, invoice: invoice, updated_at: "2019-01-24 12:00:00 UTC")

            get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(transaction.id.to_s)

            get "/api/v1/transactions/find_all?updated_at=#{transaction.updated_at}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end
    end 
end