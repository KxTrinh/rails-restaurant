# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

User.destroy_all
Product.destroy_all

User.create!(email: "kev@mail.com",
             password: '123456',
             password_confirmation: "123456",
             admin: true )

25.times do |i|
  Product.create!(name: Faker::Food.dish,
                  # description: Faker::ChuckNorris.fact,
                  description: Faker::Food.description,
                  price: rand(1..20),
                  catering: true )
end


puts "finished !!"
