# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"


User.destroy_all
Product.destroy_all
Category.destroy_all

User.create!(email: "kev@mail.com",
             password: '123456',
             password_confirmation: "123456",
             admin: true )

cat1 = Category.create!(heading: 'Pizza', body: "It's so good dough!", display: true)
cat2 = Category.create!(heading: 'Pasta', body: "We cannoli do so much in each video", display: true)
cat3 = Category.create!(heading: 'Desserts', body: "Rockj rails icecream", display: true)

10.times do |i|
  pizza = Product.new(name: 'Pizza',
                      # description: Faker::ChuckNorris.fact,
                      description: Faker::Food.description,
                      price: 11.99,
                      catering: true,
                      category: Category.find(cat1.id)
                      )

  pasta = Product.new(name: 'Pasta',
                      # description: Faker::ChuckNorris.fact,
                      description: Faker::Food.description,
                      price: 7.95,
                      catering: true,
                      category: Category.find(cat2.id)
                      )
  dessert = Product.new(name: 'Dessert',
                      # description: Faker::ChuckNorris.fact,
                      description: Faker::Food.description,
                      price: 3.00,
                      catering: true,
                      category: Category.find(cat3.id)
                      )

  # file = URI.open('https://picsum.photos/1920/1080')

  pizza.image.attach(io: URI.open('https://picsum.photos/1920/1080'), filename: "#{i}_pizza_image.jpg")
  pasta.image.attach(io: URI.open('https://picsum.photos/1920/1080'), filename: "#{i}_pasta_image.jpg")
  dessert.image.attach(io: URI.open('https://picsum.photos/1920/1080'), filename: "#{i}_dessert_image.jpg")

  if i == 5
    pizza.featured = true
    pasta.featured = true
    dessert.featured = true
  end

  pizza.save
  pasta.save
  dessert.save

end

puts "finished !!"
