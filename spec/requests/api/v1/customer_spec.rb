require "rails_helper"

describe "Customer API" do
    it 'can return a list of all customers as json' do 
        create_list(:customer, 3)

        get '/api/v1/customers'

        the_expected = JSON.parse(response.body).count 
        expect(response).to be_successful 
        expect(the_expected).to eq(3)
    end 

    it 'can return a single customer as json' do 
        customer = create(:customer, id: 1)

        get '/api/v1/customers/1'

        expect(response).to be_successful
        expect(JSON.parse(response.body)["first_name"]).to eq(customer.first_name) 
    end 
end
