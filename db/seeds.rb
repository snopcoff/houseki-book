# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! username: "Admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", is_admin: true
User.create! username: "User", email: "user@gmail.com",
  password: "123456", password_confirmation: "123456", is_admin: false

Category.create! name: "Short Story"
Category.create! name: "Long Story"
Category.create! name: "Love Story"

5.times do |n|
  Book.create!(
    title: "Lorem Ipsum-#{n+1}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut nunc vehicula, rutrum urna at, malesuada libero. Etiam arcu eros, scelerisque id sodales quis, elementum rhoncus arcu. Phasellus luctus rutrum quam, id fermentum nisl. Vestibulum quis massa at est commodo porta non et nulla. ",
    pages: 1200,
    author: "Author-#{n+1}",
    publish_time: "1/1/2011",
    category_id: 1
  )
end

5.times do |n|
  Book.create!(
    title: "Lorem Ipsum-#{n+1}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut nunc vehicula, rutrum urna at, malesuada libero. Etiam arcu eros, scelerisque id sodales quis, elementum rhoncus arcu. Phasellus luctus rutrum quam, id fermentum nisl. Vestibulum quis massa at est commodo porta non et nulla. ",
    pages: 1200,
    author: "Author-#{n+1}",
    publish_time: "1/1/2011",
    category_id: 2
  )
end

5.times do |n|
  Book.create!(
    title: "Lorem Ipsum-#{n+1}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut nunc vehicula, rutrum urna at, malesuada libero. Etiam arcu eros, scelerisque id sodales quis, elementum rhoncus arcu. Phasellus luctus rutrum quam, id fermentum nisl. Vestibulum quis massa at est commodo porta non et nulla. ",
    pages: 1200,
    author: "Author-#{n+1}",
    publish_time: "1/1/2011",
    category_id: 3
  )
end
