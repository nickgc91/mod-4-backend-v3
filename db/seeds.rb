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
  { username: "hc123", password: '123456'},
  { username: "nc123", password: '123456'},
  { username: "ms123", password: '123456'},
  { username: "aa123", password: '123456'},
  { username: "eh123", password: '123456'},
  { username: "rc123", password: '123456'},
]

scores = [
  { user_id: 1, runtime: 55 },
  { user_id: 2, runtime: 67 },
  { user_id: 2, runtime: 89 },
  { user_id: 3, runtime: 99 },
  { user_id: 3, runtime: 88 },
  { user_id: 4, runtime: 60 },
  { user_id: 4, runtime: 78 },
  { user_id: 5, runtime: 64 },
  { user_id: 5, runtime: 70 },
  { user_id: 6, runtime: 90 },
  { user_id: 6, runtime: 77 },
]

User.create users
Score.create scores


