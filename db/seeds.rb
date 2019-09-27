# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Score.destroy_all

users = [
  { username: "hc123", password_digest: '123456'},
  { username: "nc123", password_digest: '123456'},
  { username: "ms123", password_digest: '123456'},
  { username: "aa123", password_digest: '123456'},
  { username: "eh123", password_digest: '123456'},
  { username: "rc123", password_digest: '123456'},
]

scores = [
  { user_id: 1, runtime: 35 },
  { user_id: 2, runtime: 55 },
  { user_id: 2, runtime: 77 },
  { user_id: 3, runtime: 80 },
  { user_id: 3, runtime: 12 },
  { user_id: 4, runtime: 23 },
  { user_id: 4, runtime: 44 },
  { user_id: 5, runtime: 102 },
  { user_id: 5, runtime: 56 },
  { user_id: 6, runtime: 73 },
  { user_id: 6, runtime: 39 },
]

User.create users
Score.create scores


