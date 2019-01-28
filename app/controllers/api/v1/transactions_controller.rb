class Api::V1::TransactionsController < ApplicationController 
    def index
        if params[:customer_id]
            render json: TransactionSerializer.new(Transaction.joins(invoice: :customer).where("customers.id =  #{params[:customer_id]}"))
        else 
            render json: TransactionSerializer.new(Transaction.all)
        end
    end

    def show
        render json: TransactionSerializer.new(Transaction.find(params[:id]))
    end
end 