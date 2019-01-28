require "rails_helper"

describe "Customer API" do
    it 'can return a list of all customers as json' do 
        create_list(:customer, 3)

        get '/api/v1/customers'

        expect(response).to be_successful 
        the_expected = JSON.parse(response.body)["data"].count 
        expect(the_expected).to eq(3)
    end 

    it 'can return a single customer as json' do 
        customer = create(:customer, id: 1)

        get '/api/v1/customers/1'

        expect(response).to be_successful
        expect(JSON.parse(response.body)["data"]["attributes"]["first_name"]).to eq(customer.first_name) 
    end
    
    describe 'can find one or all by parameters' do
        it 'can find a merchant by id' do 
            customer = create(:customer)

            get "/api/v1/customers/find?id=#{customer.id}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq("#{customer.id}") 
        end
        it 'can find a merchant by first name' do 
            customer = create(:customer, first_name: "how now", last_name: "brown cow")
            customer1 = create(:customer, first_name: "how now", last_name: "brown cow")

            get "/api/v1/customers/find?first_name=#{customer.first_name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq("#{customer.id}")

            
            get "/api/v1/customers/find_all?name=#{customer.first_name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end
        it 'can find a merchant by last name' do 
            customer = create(:customer, last_name: "how now")
            customer1 = create(:customer, last_name: "how now")

            get "/api/v1/customers/find?last_name=#{customer.last_name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq("#{customer.id}")

            get "/api/v1/customers/find_all?last_name=#{customer.last_name}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
        it 'can find a merchant by created at' do 
            customer = create(:customer, created_at: "2019-01-24 12:00:00 UTC")
            customer1 = create(:customer, created_at: "2019-01-24 12:00:00 UTC")
            
            get "/api/v1/customers/find?created_at=#{customer.created_at}"
            
            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq("#{customer.id}")
            
            get "/api/v1/customers/find_all?created_at=#{customer.created_at}"
            
            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
        it 'can find a merchant by updated at' do 
            customer = create(:customer, updated_at: "2019-01-24 12:00:00 UTC")
            customer1 = create(:customer, updated_at: "2019-01-24 12:00:00 UTC")

            get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"]["id"]).to eq("#{customer.id}")

            get "/api/v1/customers/find_all?updated_at=#{customer.updated_at}"

            expect(response).to be_successful
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
    end 
end
