class Api::V1::SearchController < ApplicationController
    def find_merchant
        render json: MerchantSerializer.new(Merchant.find_by(merchant_params))
    end
    def find_merchants
        render json: MerchantSerializer.new(Merchant.where(merchant_params))
    end

    def find_customer
        render json: CustomerSerializer.new(Customer.find_by(customer_params))
    end 
    def find_customers
        render json: CustomerSerializer.new(Customer.where(customer_params))
    end 

    def find_invoice
        render json: InvoiceSerializer.new(Invoice.find_by(invoice_params))
    end
    def find_invoices
        render json: InvoiceSerializer.new(Invoice.where(invoice_params))
    end

    def find_invoice_item
        render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
    end
    def find_invoice_items
        render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
    end

    def find_item
        render json: ItemSerializer.new(Item.find_by(item_params))
    end 
    def find_items
        render json: ItemSerializer.new(Item.where(item_params))
    end 

    private
    
    def merchant_params
        params.permit(:id, :name, :created_at, :updated_at)
    end
    
    def customer_params
        params.permit(:first_name, :last_name)
    end

    def invoice_params
        params.permit(:status)
    end 

    def invoice_item_params
        params.permit(:quantity, :unit_price)
    end 

    def item_params
        params.permit(:name, :desciption, :unit_price)
    end 
end 