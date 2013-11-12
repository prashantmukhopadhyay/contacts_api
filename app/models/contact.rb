class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :user_id
  validates :email, :name, :user_id, presence: :true
  validates :email, uniqueness: :true

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id)

  has_many(
    :contact_shares,
    class_name: 'ContactShare'
    foreign_key: :contact_id,
    primary_key: :id)

  has_many :shared_contacts, through: :contact_shares, source: :contact

  def self.contacts_for_user_id(user_id)
    user_contacts = self
      .join('LEFT OUTER JOIN contact_shares ON contacts.id = contact_shares.contact_id')
      .where('contacts.user_id = ? OR contact_shares.user_id = ?', user_id, user_id)
  end
end
