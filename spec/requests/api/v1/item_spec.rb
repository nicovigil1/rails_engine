require "rails_helper"

describe "item api" do
    it 'can return all of the items as json' do
        merchant = create(:merchant)
        item1, item2 = create_list(:item, 2, merchant: merchant)

        get '/api/v1/items'

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"].count).to eq(2)
    end 

    it 'can return a single item as json' do 
        merchant = create(:merchant)
        item1, item2 = create_list(:item, 2, merchant: merchant)

        get "/api/v1/items/#{item1.id}"

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)
    end 

    describe "can find one or all items with the attribute:" do
        it 'name' do 
            merchant = create(:merchant)
            item1, item2 = create_list(:item, 2, merchant: merchant)

            get "/api/v1/items/find?name=#{item1.name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)
        end
        it 'name' do 
            merchant = create(:merchant)
            item1, item2 = create_list(:item, 2, merchant: merchant, name: "name1")

            get "/api/v1/items/find?name=#{item1.name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)

            get "/api/v1/items/find_all?name=#{item1.name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
        it 'description' do 
            merchant = create(:merchant)
            item1, item2 = create_list(:item, 2, merchant: merchant, name: "name1")

            get "/api/v1/items/find?description=#{item1.description}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)

            get "/api/v1/items/find_all?description=#{item1.description}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
        it 'unit_price' do 
            merchant = create(:merchant)
            item1, item2 = create_list(:item, 2, merchant: merchant, name: "name1")

            get "/api/v1/items/find?unit_price=#{item1.unit_price}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)

            get "/api/v1/items/find_all?unit_price=#{item1.unit_price}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
        it 'created_at' do 
            merchant = create(:merchant)
            item1, item2 = create_list(:item, 2, merchant: merchant, created_at: "2019-01-24 12:00:00 UTC")

            get "/api/v1/items/find?created_at=#{item1.created_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)

            get "/api/v1/items/find_all?created_at=#{item1.created_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
        it 'updated_at' do 
            merchant = create(:merchant)
            item1, item2 = create_list(:item, 2, merchant: merchant, updated_at: "2019-01-24 12:00:00 UTC")

            get "/api/v1/items/find?updated_at=#{item1.updated_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq(item1.id.to_s)

            get "/api/v1/items/find_all?updated_at=#{item1.updated_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
    end
    
end
