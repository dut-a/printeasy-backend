# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# DELETE data
# 1. Address
puts "Begin: Destroying Addresses"
Address.destroy_all
puts "End: Destroying Addresses"

# 2. Print
puts "Begin: Destroying Prints"
Print.destroy_all
puts "End: Destroying Prints"

# 3. Service
puts "Begin: Destroying Services"
Service.destroy_all
puts "End: Destroying Services"

# 4. User
puts "Begin: Destroying Users"
User.where.not(username: "dut").destroy_all
puts "End: Destroying Users"


# CREATE data
# 1. User
puts "Begin: Adding Users"
# Create 'Master Dut' if not exists
if !User.where(username: "dut").exists?
  puts "Dut doesn't exist, creating him..."
  User.create(
    username: "dut",
    password: "dut",
    user_type: "admin",
    bio: "Some invisible nerd to control it all behind the scenes. Watch out for the smog!",
    picture: "https://www.dutad.com/images/dut-a.jpg",
    phone_number: "555-555-1234",
    email_address: "dut.a@printeasy.com",
    physical_address: "123 Main St, Citygo, NewState 22121",
    first_name: "Dut",
    middle_name: "Athian",
    last_name: "Dut"
  )
end

# customers
5.times do
  User.create(
    username: Faker::Name.first_name.downcase,
    password: "word",
    user_type: "customer",
    bio: Faker::TvShows::Friends.quote,
    picture: Faker::Fillmurray.image,
    phone_number: Faker::PhoneNumber.phone_number,
    email_address: Faker::Internet.email,
    physical_address: Faker::Address.full_address,
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name
  )
end

# merchants
5.times do
  User.create(
    username: Faker::Name.first_name.downcase,
    password: "word",
    user_type: "merchant",
    bio: Faker::TvShows::Friends.quote,
    picture: Faker::Fillmurray.image,
    phone_number: Faker::PhoneNumber.cell_phone,
    email_address: Faker::Internet.email,
    physical_address: Faker::Address.full_address,
    name: Faker::Company.name,
    fax_number: Faker::PhoneNumber.phone_number,
    website: Faker::Internet.url,
    business_hours: "Monday - Friday: 8:00 a.m. - 6:00 p.m."
  )
end
puts "End: Adding Users"

# 2. Address
puts "Begin: Adding Addresses"
user_ids = User.pluck(:id)
f = Faker::Address
10.times do
  Address.create(
    line_1: "#{f.building_number} #{f.street_name}",
    line_2: f.secondary_address,
    city: f.city,
    state: f.state,
    zip: f.zip_code.to_i,
    user_id: user_ids.shift
  )
end
puts "End: Adding Addresses"

# 3. Service
puts "Begin: Adding Services (merchants only)"
merchant_ids = User.where(user_type: "merchant").pluck(:id)
periods = ["2 hours", "1 day", "3 days", "30 minutes"]
types = ["Photo", "Legal Document", "General Document", "3D"]
merchant_ids.length.times do
  Service.create(
    service_type: types.sample,
    cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    time_to_complete: periods.sample,
    user_id: merchant_ids.shift
  )
end
puts "End: Adding Services (merchants only)"

# 4. Print
puts "Begin: Adding Prints (customers only)"

customer_ids = User.where(user_type: "customer").pluck(:id)
merchant_ids = User.where(user_type: "merchant").pluck(:id)
service_ids = Service.pluck(:id)
periods = ["2 hours", "1 day", "3 days", "30 minutes"]
types = ["Photo", "Legal Document", "General Document", "3D"]
statuses = ["unstarted", "in progress", "completed"]

customer_ids.length.times do
  current_customer_id = customer_ids.shift
  current_merchant_id = merchant_ids.shift
  Print.create(
    print_type: types.sample,
    number_of_copies: [1, 3, 5, 9, 23, 8].sample,
    ordered_by: current_customer_id,
    fulfilled_by: current_merchant_id,
    payment_method: ["in-person", "online"].sample,
    payment_status: ["paid", "unpaid"].sample,
    pickup_location: User.where(id: current_merchant_id)[0].physical_address,
    pickup_type: ["delivery", "in-persion"].sample,
    delivery_address: User.where(id: current_customer_id)[0].physical_address,
    placed_on: Faker::Date.backward,
    estimated_completion_time: periods.sample, # service type completion time * number of copies
    status: statuses.sample,
    user_id: current_customer_id,
    service_id: service_ids.shift
  )
end
puts "End: Adding Prints (customers only)"

