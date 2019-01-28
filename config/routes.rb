Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do

      scopes = ["merchant", "customer", "invoice", "invoice_item", "item", "transaction"]

      scopes.each do |resource|
        namespace resource.pluralize.to_sym do
          get 'find', to: "search#show"
          get 'find_all', to: "search#index"
        end
      end

      resources :merchants, only: [:index, :show] do 
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      resources :customers, only: [:index, :show] do 
        resources :invoices, only: [:index] 
        resources :transactions, only: [:index]
      end
      
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end 
  end 
end
