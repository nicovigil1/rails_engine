class Api::V1::InvoiceItems::SearchController < ApplicationController
    def show
        render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
    end
    def index
        render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
    end

    private

    def invoice_item_params
        params.permit(:quantity, :unit_price)
    end 
end 