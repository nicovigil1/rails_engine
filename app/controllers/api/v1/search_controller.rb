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
end 