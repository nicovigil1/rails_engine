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
        expect(JSON.parse(response.body)["item_id"]).to eq(item.id) 

    end 
end
