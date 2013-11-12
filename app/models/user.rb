class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates :name, :email, presence: :true
  validates :email, uniqueness: :true

  has_many(
    :contacts,
    class_name: 'Contact',
    foreign_key: :user_id,
    primary_key: :id)

  has_many(
    :contact_shares,
    class_name: 'ContactShare',
    foreign_key: :user_id,
    primary_key: :id)
end
