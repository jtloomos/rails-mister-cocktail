Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[new create show index]

  resources :cocktails do
    resources :doses, only: %i[new create destroy]
  end

  resources :doses, only: %i[destroy]
end
