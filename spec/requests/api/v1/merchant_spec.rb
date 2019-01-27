require "rails_helper"

describe "merchant api" do
    it 'can return all of the merchants as json' do  
        merchant1, merchant2 = create_list(:merchant, 2)

        get '/api/v1/merchants'

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"].count).to eq(2)
    end 

    it 'can return a single merchant as json' do 
        merchant = create(:merchant)

        get "/api/v1/merchants/#{merchant.id}"
        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"]["id"]).to eq(merchant.id.to_s)
    end 

    describe 'can find a specific merchant' do 
        it 'by primary key (id)' do 
            merchant = create(:merchant)

            get "/api/v1/merchants/find?id=#{merchant.id}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(merchant.id.to_s) 
        end 
        it 'by merchant name' do 
            merchant = create(:merchant)

            get "/api/v1/merchants/find?name=#{merchant.name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(merchant.id.to_s) 
            expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(merchant.name) 
        end 
        it 'by merchant created_at' do 
            merchant = create(:merchant, created_at: "2019-01-24 12:00:00 UTC")

            get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(merchant.name) 
        end 
    end
end