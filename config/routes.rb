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


# Comment.create(user_id: who makes comment, contact_id: who is commented on, body: text)
# # comment belongs_to user
# # user has_many comments
#
# # contact has_many :comments
# # comment belongs_to :contact
#
# # comments migration
# add_index :comments, [:user_id, :contact_id] unique: true
# # comment model (check syntax)
# validates :user_id, {scope: :contact_id}, uniqueness: :true