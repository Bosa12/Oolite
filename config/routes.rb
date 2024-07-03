Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/gallery", to: "pages#gallery"
  get "/contact", to: "pages#contact"
  get "/service", to: "service#index"
  # get "/project", to: "project#index"

  resources :projects, only: [:index, :show, :new, :create]
  # get "/project/:id", to: "project#show", as: 'project'

end
