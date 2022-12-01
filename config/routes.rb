Rails.application.routes.draw do
  resources :apartments
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }, defaults: { format: :json }
  get '/member-data', to: 'members#show'
  patch '/member-update', to: 'members#update'
end