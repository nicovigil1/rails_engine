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

    describe 'can find a specific merchant & all merchants by attribute' do 
        it 'by primary key (id)' do 
            merchant = create(:merchant)

            get "/api/v1/merchants/find?id=#{merchant.id}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(merchant.id.to_s) 
        end 
        it 'by merchant name' do 
            merchant = create(:merchant, name: "holmes")
            merchant2 = create(:merchant, name: "holmes")

            #find one
            get "/api/v1/merchants/find?name=#{merchant.name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(merchant.id.to_s) 
            expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(merchant.name)
            
            #find all 
            get "/api/v1/merchants/find_all?name=#{merchant.name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2) 

        end 
        it 'by merchant created_at' do 
            merchant = create(:merchant, created_at: "2019-01-24 12:00:00 UTC")
            merchant2 = create(:merchant, created_at: "2019-01-24 12:00:00 UTC")
            
            #find one
            get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

            expect(response).to be_successful

            expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(merchant.name) 

            #find all
            get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

            expect(response).to be_successful

            expect(JSON.parse(response.body)["data"].length).to eq(2) 
        end 
        it 'by merchant updated_at' do 
            merchant = create(:merchant, updated_at: "2019-01-24 12:00:00 UTC")
            merchant2 = create(:merchant, updated_at: "2019-01-24 12:00:00 UTC")

            #find one
            get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
            
            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(merchant.name) 
            
            #find all
            get "/api/v1/merchants/find_all?updated_at=#{merchant.updated_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2) 
        end 
    end
end