Rails.application.routes.draw do
  root to: "admin#index"
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :logs do
    collection do
      get :manage_logs
    end
  end

  resources :users
  resources :company_profiles

  get 'admin/user' => 'users#index', as: :users_view, via: [:get, :post]
  get 'admin/user/new' => 'users#new', as: :users_new
  # match ''
  get 'admin' => 'admin#index', :as => :admin
end
