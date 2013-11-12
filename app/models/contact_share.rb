class ContactShare < ActiveRecord::Base
  attr_accessible :contact_id, :user_id
  validates :contact_id, :user_id, presence: :true

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id)

  belongs_to(
    :contact,
    class_name: 'Contact',
    foreign_key: :contact_id,
    primary_key: :id)
end
