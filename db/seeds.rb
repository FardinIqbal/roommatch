# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
Swipe.destroy_all
User.destroy_all

# Create fake users
10.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    password: "password",
    password_confirmation: "password",
    name: "User #{i}",
    school: ["Stony Brook", "NYU", "Columbia"].sample,
    bio: "Hi, I'm user #{i}, looking for a roommate!",
    sleep_schedule: %w[early night].sample,
    clean: [true, false].sample
  )
end

puts "Created #{User.count} users."
