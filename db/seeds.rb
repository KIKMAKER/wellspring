# db/seeds.rb
puts "🌱 Clearing the database..."
Delivery.destroy_all
DeliveryDay.destroy_all
InvoiceItem.destroy_all
Invoice.destroy_all
Product.destroy_all
Payment.destroy_all
User.destroy_all

puts "👤 Creating team users..."
kiki = User.create!(
  name: "Kiki Kenn",
  email: "kiki@wellspring.life",
  phone_number: "+27836353126",
  address: "27 Hare Street",
  role: :admin,
  password: "password",
  container_paid_at: Time.current
)

alfred = User.create!(
  name: "Alfred Mbonjwa",
  email: "alfie@wellspring.life",
  phone_number: "+27785325513",
  address: "27 Hare Street",
  role: :driver,
  password: "password"
)

puts "🌿 Creating customers..."
names = [
  "Petal Rosevine", "Elowen Sparkleseed", "Tansy Glowfern",
  "Rue Mistwillow", "Isla Stardust", "Junie Nailpetal"
]

users = names.map do |name|
  User.create!(
    name: name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    role: :customer,
    password: "password",
    container_paid_at: rand(1..7).days.ago
  )
end

puts "✅ Created #{users.count} customers"

puts "📦 Seeding products..."
products = [
  { title: "Single Delivery", description: "One-time Monday drop", price: 210 },
  { title: "4-Week Bundle", description: "Four consecutive Mondays", price: 600 },
  { title: "Container Starter Pack", description: "Your first set of bottles", price: 300 }
]

products.each do |prod|
  Product.create!(prod)
end

puts "✅ #{Product.count} products added"

puts "📆 Creating upcoming delivery days..."
next_monday = Date.today.next_occurring(:monday)
4.times do |i|
  DeliveryDay.create!(
    date: next_monday + i.weeks,
    user: alfred,
    capacity: 20,
    filled_slots: 0,
    note: ["Spring calm", "Bring torch", "Route change", nil].sample
  )
end

puts "✅ #{DeliveryDay.count} delivery days added"

puts "🌊 Wellspring is seeded and ready to flow."
