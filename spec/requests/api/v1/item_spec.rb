require "rails_helper"

describe "item api" do
    it 'can return all of the items as json' do
        merchant = create(:merchant)
        item1, item2 = create_list(:item, 2, merchant: merchant)

        get '/api/v1/items'

        expect(response).to be_successful
        expect(JSON.parse(response.body).count).to eq(2)
    end 

    it 'can return a single item as json' do 
        merchant = create(:merchant)
        item1, item2 = create_list(:item, 2, merchant: merchant)

        get "/api/v1/items/#{item1.id}"

        expect(response).to be_successful
        expect(JSON.parse(response.body)["id"]).to eq(item1.id)
    end 
end
