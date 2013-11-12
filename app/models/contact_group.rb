class ContactGroup < ActiveRecord::Base
  attr_accessible :name, :user_id
  validates :name, :user_id, presence: :true

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id)

  has_many(
    :groupings,
    class_name: 'Grouping',
    foreign_key: :contact_group_id,
    primary_key: :id)

  has_many :contacts, through: :groupings, source: :contact

  def self.contact_groups_for_user(user_id)
    user_contact_groups = self
      .where('contact_groups.user_id = ?', user_id)
  end
end
