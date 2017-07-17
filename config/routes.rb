Rails.application.routes.draw do
  root to: "admin#index"

  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :logs do
    collection do
      get :manage_logs
    end
  end

  resources :users

  resources :current_fiscal_years

  resources :company_profiles do
    collection do
      get :manage_company_profiles
    end
  end

  resources :fiscal_years do
    collection do
      get :manage_fiscal_years
    end
  end

  resources :units

  resources :item_groups

  resources :items do
    collection do
      get '/stock' => :show_lowest
    end
  end

  resources :stocks

  resources :purchases

  resources :vendors

  resources :sales do
    member do
      get '/get/unit/price' => :get_unit_price
    end
  end

  resources :pdfs do
    collection do
      get "/purchases/report" => :purchase_report
      get "/sales/report" => :sale_report
    end
  end
  resources :customers

  resources :sale_items

  resources :purchase_items

  get 'admin/user' => 'users#index', as: :users_view, via: [:get, :post]
  get 'admin/user/new' => 'users#new', as: :users_new
  get 'admin' => 'admin#index', :as => :admin
  get '/sale/:id(.:format)' => 'sale_items#show', as: :get_sale
  get '.purchase/:id(.:format)' => 'purchase_items#show', as: :get_purchase
  get 'setting' => 'admin#show', as: :setting

  end
