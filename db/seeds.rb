# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

Item.delete_all

20.times do
  item = Item.create!(
        title: Faker::GreekPhilosophers.name,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        price: Faker::Commerce.price(range: 2.00..500.00, as_string: true),
        image_url: Faker::LoremFlickr.image(size: "600x600"),
    )
end
