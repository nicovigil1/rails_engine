require "rails_helper"

describe "invoice_item api" do
    it 'can return all of the invoice items as json' do 
        merchant = create(:merchant)
        customer = create(:customer)
        item = create(:item, merchant: merchant)
        invoice = create(:invoice, merchant: merchant, customer: customer)
        invoice_item1, invoice_item2 = create_list(:invoice_item, 2, invoice: invoice, item: item )

        get "/api/v1/invoice_items"

        expect(response).to be_successful 
        expect(JSON.parse(response.body).count).to eq(2) 
    end 

    it 'can return a single invoice item as json' do 
        merchant = create(:merchant)
        customer = create(:customer)
        item = create(:item, merchant: merchant)
        invoice = create(:invoice, merchant: merchant, customer: customer)
        invoice_item = create(:invoice_item, invoice: invoice, item: item )

        get "/api/v1/invoice_items/#{invoice_item.id}"

        expect(response).to be_successful 
        expect(JSON.parse(response.body)["id"]).to eq(invoice_item.id) 
    end 

    describe "can find invoice_item by the attribute:" do
        it 'id' do 
            merchant = create(:merchant)
            customer = create(:customer)
            item = create(:item, merchant: merchant)
            invoice = create(:invoice, merchant: merchant, customer: customer)
            invoice_item = create(:invoice_item, invoice: invoice, item: item )

            get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(invoice_item.id.to_s) 
        end 
        
        it 'quantity' do
            merchant = create(:merchant)
            customer = create(:customer)
            item = create(:item, merchant: merchant)
            invoice = create(:invoice, merchant: merchant, customer: customer)
            invoice_item = create(:invoice_item, invoice: invoice, item: item, quantity: 12 )
            invoice_item1 = create(:invoice_item, invoice: invoice, item: item, quantity: 12 )

            get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(invoice_item.id.to_s) 

            get "/api/v1/invoice_items/find_all?quantity=#{invoice_item.quantity}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2) 
        end 

        it 'unit_price' do 
            merchant = create(:merchant)
            customer = create(:customer)
            item = create(:item, merchant: merchant)
            invoice = create(:invoice, merchant: merchant, customer: customer)
            invoice_item = create(:invoice_item, invoice: invoice, item: item, unit_price: 12 )
            invoice_item1 = create(:invoice_item, invoice: invoice, item: item, unit_price: 12 )

            get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price.to_s}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"]["id"]).to eq(invoice_item.id.to_s) 

            get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item.unit_price.to_s}"

            expect(response).to be_successful 
            expect(JSON.parse(response.body)["data"].length).to eq(2)
        end 
    end
    
end
