class Api::V1::MerchantsController < ApplicationController 
    def index
        render json: MerchantSerializer.new(Merchant.all)
    end

    def show 
        render json: MerchantSerializer.new(Merchant.find(params[:id]))
    end 

    def find
        if params[:id]
            render json: MerchantSerializer.new(Merchant.find(params[:id]))
        elsif params[:name]
            render json: MerchantSerializer.new(Merchant.find_by(name: params[:name]))
        elsif params[:created_at]
            render json: MerchantSerializer.new(Merchant.find_by(created_at: params[:created_at].to_time))
        end
    end
end 