Rails.application.routes.draw do
  resources :occupations   do
    collection do
      get :of_tday
    end
    collection do
      get :admin
    end
  end
  resources :regulations
  resources :calenders
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  # Defines the root path route ("/")
  root "rooms#index"
end
