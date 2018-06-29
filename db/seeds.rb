# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
expert_categories = ["Psychic readings", "Love & relationships", "Life questions", "Tarot readings", "Spiritual readings", "All categories"]
expert_categories.each do |name|
  ExpertCategory.where(name: name).first_or_create
end
