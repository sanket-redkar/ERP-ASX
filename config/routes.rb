Rails.application.routes.draw do
  resources :reportings do
    resources :images
  end
  resources :campaigns do
    member do
      get :available_dates
      post :assign_site
    end
  end
  resources :ooh_sites do
    resources :reportings, only: :index, controller: 'ooh_sites/reportings'
  end

  resources :clients
  resources :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'owners#index'
end
