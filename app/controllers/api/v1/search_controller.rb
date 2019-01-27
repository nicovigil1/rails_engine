class Api::V1::SearchController < ApplicationController
    def find_merchant
        render json: MerchantSerializer.new(Merchant.find_by(merchant_params))
    end

    def find_merchants
        render json: MerchantSerializer.new(Merchant.where(merchant_params))
    end 

    private

    def merchant_params
        params.permit(:id, :name, :created_at, :updated_at)
    end
end 