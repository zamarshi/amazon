# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = 'z'

50.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password_digest = User.new(:password => password).password_digest
  user.save
end

10.times do
Tag.create(name: Faker::GameOfThrones.house)
end
tags = Tag.all


puts Cowsay.say('Generated up to 10 tags', 'random')

6.times do
  Category.create({ title: Faker::Commerce.product_name })
end

categories = Category.all

30.times do
  Product.create({ title:      Faker::Company.catch_phrase,
                   user: User.all.sample,
                   description:  Faker::Hacker.say_something_smart,
                   price: rand(1000),
                   tags: tags.sample(rand(3) + 1),
                   category: categories.sample() })
end

puts Cowsay.say('Generated 30 products', 'random')
