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
        require 'pry'; binding.pry
        expect(response).to be_successful
        expect(JSON.parse(response.body)["id"]).to eq(merchant.id)
    end 
end