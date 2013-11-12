Contacts::Application.routes.draw do
  resources :users do
    resources :contacts, only: [:index]
  end
  resources :contacts, except: [:new, :edit, :index]
  resources :contact_shares, only: [:create, :destroy]
end
