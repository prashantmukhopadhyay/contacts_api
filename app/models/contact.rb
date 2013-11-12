class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :user_id, :favorite
  before_validation :set_favorite_to_false, on: :create
  validates :email, :name, :user_id, presence: :true
  validates :email, uniqueness: :true
  validates :favorite, :inclusion => { :in => [true, false] }

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id)

  has_many(
    :contact_shares,
    class_name: 'ContactShare',
    foreign_key: :contact_id,
    primary_key: :id)

  has_many(
    :groupings,
    class_name: 'Grouping',
    foreign_key: :contact_id,
    primary_key: :id)

  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: :contact_id,
    primary_key: :id)

  has_many :shared_contacts, through: :contact_shares, source: :contact
  has_many :contact_groupings, through: :groupings, source: :contact_group

  def self.contacts_for_user_id(user_id)
    user_contacts = self
      .joins('LEFT OUTER JOIN contact_shares ON contacts.id = contact_shares.contact_id')
      .where('contacts.user_id = ? OR contact_shares.user_id = ?', user_id, user_id)
  end

  def self.favorites(user_id)
    user_favorites = self
      .where('contacts.favorite = ? AND contacts.user_id = ?', true, user_id)
  end

  def self.comments(user_id, id)
    user_contacts_comments = Comment
      .select('comments.body')
      .joins(:contact)
      .where('comments.user_id = ? AND comments.contact_id = ?', user_id, id)
  end

  protected

  def set_favorite_to_false
    self.favorite = false if self.favorite.nil?
    true
  end
end
