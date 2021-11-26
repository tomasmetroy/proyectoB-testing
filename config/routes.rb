Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :showtimes do
    resources :tickets
  end
  resources :movies
  get '', to: 'showtimes#index', as: 'home'
end
