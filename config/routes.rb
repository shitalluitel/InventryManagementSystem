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

  get 'admin/user' => 'users#index', as: :users_view, via: [:get, :post]
  get 'admin/user/new' => 'users#new', as: :users_new
  get 'admin' => 'admin#index', :as => :admin
end
