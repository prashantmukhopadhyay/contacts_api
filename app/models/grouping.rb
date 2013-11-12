class Grouping < ActiveRecord::Base
  attr_accessible :contact_group_id, :contact_id

  belongs_to(
    :contact_group,
    class_name: 'ContactGroup',
    foreign_key: :contact_group_id,
    primary_key: :id)

  belongs_to(
    :contact,
    class_name: 'Contact',
    foreign_key: :contact_id,
    primary_key: :id)
end
