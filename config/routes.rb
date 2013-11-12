Contacts::Application.routes.draw do
  resources :users do
    resources :contacts, only: [:index] do
      collection do
        get 'favorites'
      end
      member do
        get 'comments'
      end
    end
    resources :contact_groups, only: [:index]
  end
  resources :contacts, except: [:new, :edit, :index]
  resources :contact_shares, only: [:create, :destroy]
  resources :contact_groups, except: [:new, :edit, :index]
end