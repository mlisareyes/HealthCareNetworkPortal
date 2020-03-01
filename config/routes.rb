Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
  delete '/apppointment/:id' => 'appointments#destroy'
  delete '/patient/:id' => 'patients#destroy'
  delete '/note/:id' => 'notes#destroy'

#omniauth callback route
  get '/auth/:provider/callback' => 'sessions#google'

  resources :users do
    resources :patients, :appointments, shallow: true
  end
  resources :patients do
    resources :notes, :appointments
  end
  resources :appointments
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
