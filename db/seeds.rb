# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(name: 'Prashant', email: 'prashant@example.com')
user2 = User.create(name: 'Evan', email: 'ev@example.com')

contact1 = Contact.create(name: 'Tommy', email: 'tommy@example.com', user_id: 2)
contact2 = Contact.create(name: 'Sid', email: 'sid@example.com', user_id: 1, favorite: true)
contact3 = Contact.create(name: 'Jonathan', email: 'jonathan@example.com', user_id: 1)

cs1 = ContactShare.create(user_id: 2, contact_id: 2)
cs2 = ContactShare.create(user_id: 1, contact_id: 1)
cs3 = ContactShare.create(user_id: 2, contact_id: 3)

cg1 = ContactGroup.create(name: 'friends', user_id: 1)
g1 = Grouping.create(contact_group_id: 1, contact_id: 2)
g2 = Grouping.create(contact_group_id: 1, contact_id: 3)

comment1 = Comment.create(body: 'Jonathan loves cats!',
                          contact_id: 3, user_id: 1)