class Api::V1::InvoicesController < ApplicationController
    def index
        if params[:customer_id]
            render json: InvoiceSerializer.new(Invoice.where(customer_id: params["customer_id"]))
        else
            render json: InvoiceSerializer.new(Invoice.all)
        end
    end 

    def show
        render json: InvoiceSerializer.new(Invoice.find(params[:id]))
    end
end 