Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails do
    resources :doses
  end
  resources :doses, only: [:destroy]
end
