Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      scope :merchants do 
        get '/find', to: "search#find_merchant"
        get '/find_all', to: "search#find_merchants"
      end 
      resources :merchants, only: [:index, :show]

      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end 
  end 
end
