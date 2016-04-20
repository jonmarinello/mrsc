# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'recommendation_loader'

if Rails.env.development?
  puts 'Loading admin users...'
  AdminUser.create!(email: 'jonmarinello@gmail.com', password: 'password')

  puts 'Loading recommendations...'
  RecommendationsLoader.load_recommendations
end
