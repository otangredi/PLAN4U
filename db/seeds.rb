# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#User, Event, Guest, Guest choices

################################@#user seeds#################################

#t.string "email"
#t.string "last_name"
#t.string "first_name"

puts "Creating 1 user..."
User.create!(
  email: "lewagon@gmail.com",
  password: "lewagon",
  last_name: "Borremans",
  first_name: "Anthony"
)
puts "User Finished!"

###################################events seeds##############################

#t.date "date"
#t.string "venue"
#t.string "partner_name"
#t.bigint "user_id"

puts "Creating event..."
Event.create!(
  date: "Sun, 25 Dec 2022",
  venue: "Montreal",
  partner_name: "Galice",
  name: "Wedding",
  user_id: "1"
)
puts "Event Finished!"

###################################Guest seeds##############################
#t.string "relationship"
#t.string "email"
#t.integer "status", default: 0
#t.bigint "event_id", null: false
#t.string "first_name"
#t.string "last_name"
#t.index ["event_id"]

################################Guest Olivia Events#####
# puts "Creating guest familly..."
# Guest.create!(
#   relationship: "Mom",
#   email: "",
#   status: "",
#   event_id: "2",
#   last_name: "",
#   first_name: ""
# )
# Guest.create!(
#   relationship: "Dad",
#   email: "",
#   status: "",
#   event_id: "2",
#   last_name: "",
#   first_name: ""
# )
# Guest.create!(
#   relationship: "Sister",
#   email: "",
#   status: "",
#   event_id: "2",
#   last_name: "",
#   first_name: ""
# )

# puts "Guest familly Finished!"

puts "Creating 30 random guest friend..."
30.times do |i|
  Guest.create!(
    relationship: "Friend",
    email: Faker::Internet.unique.email,
    status: "0",
    event_id: "1",
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.unique.name
  )
  # puts "#{i + 1}. #{guest.name}"
end
puts "30 random guest friend Finished!"
################################Guest-choises Olivia Events#####
#t.string "choices"
#t.bigint "guest_id"

# puts "Creating guest-choise familly..."
# Guest_choices.create!(
#   choices: ["10", "2"],
#   guest_id: "1"
# )
# Guest_choices.create!(
#   choices: ["1", "3"],
#   guest_id: "2"
# )
# Guest_choices.create!(
#   choices: ["2", "4"],
#   guest_id: "3"
# )
# Guest_choices.create!(
#   choices: ["3", "5"],
#   guest_id: "4"
# )
# Guest_choices.create!(
#   choices: ["4", "6"],
#   guest_id: "5"
# )
# Guest_choices.create!(
#   choices: ["5", "7"],
#   guest_id: "6"
# )
# Guest_choices.create!(
#   choices: ["6", "8"],
#   guest_id: "7"
# )
# Guest_choices.create!(
#   choices: ["7", "9"],
#   guest_id: "8"
# )
# Guest_choices.create!(
#   choices: ["8", "10"],
#   guest_id: "9"
# )
# Guest_choices.create!(
#   choices: ["9", "1"],
#   guest_id: "10"
# )
# puts "Guest_choices familly Finished!"
# puts "Creating 30 random guest_choices friend..."

# 30.times do |i|
#   Guest_choices.create!(
#     choices: [(11..30).sample, (11..30).sample],
#     guest_id: (i + 1) + 10
#   )
# end
# puts "30 random guest friend Finished!"
