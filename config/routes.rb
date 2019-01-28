Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do

      scopes = ["merchant", "customer", "invoice", "invoice_item", "item", "transaction"]

      scopes.each do |resource|
        scope resource.pluralize.to_sym do 
          get 'find', to: "search#find_#{resource}"
          get 'find_all', to: "search#find_#{resource.pluralize}"
        end
      end

      # scope :merchants do 
      #   get '/find', to: "search#find_merchant"
      #   get '/find_all', to: "search#find_merchants"
      # end 
      resources :merchants, only: [:index, :show]

      # scope :customers do 
      #   get '/find', to: "search#find_customer"
      #   get '/find_all', to: "search#find_customers"
      # end 
      resources :customers, only: [:index, :show]

      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end 
  end 
end
