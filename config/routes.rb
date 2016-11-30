Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end
  
  root "lists#index"
end
