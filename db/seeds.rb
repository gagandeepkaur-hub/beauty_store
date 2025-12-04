# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Provinces with tax rates
provinces_data = [
  { name: 'Alberta', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 },
  { name: 'British Columbia', gst_rate: 5.0, pst_rate: 7.0, hst_rate: 0.0 },
  { name: 'Manitoba', gst_rate: 5.0, pst_rate: 7.0, hst_rate: 0.0 },
  { name: 'New Brunswick', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Newfoundland and Labrador', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Northwest Territories', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 },
  { name: 'Nova Scotia', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Nunavut', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 },
  { name: 'Ontario', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 13.0 },
  { name: 'Prince Edward Island', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Quebec', gst_rate: 5.0, pst_rate: 9.975, hst_rate: 0.0 },
  { name: 'Saskatchewan', gst_rate: 5.0, pst_rate: 6.0, hst_rate: 0.0 },
  { name: 'Yukon', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 }
]

provinces_data.each do |province_data|
  Province.find_or_create_by(name: province_data[:name]) do |province|
    province.gst_rate = province_data[:gst_rate]
    province.pst_rate = province_data[:pst_rate]
    province.hst_rate = province_data[:hst_rate]
  end
end

puts "Created #{Province.count} provinces"

# Create Categories
categories_data = [
  { name: 'Skincare', description: 'Products for facial and body skincare' },
  { name: 'Makeup', description: 'Cosmetics for face, eyes, and lips' },
  { name: 'Haircare', description: 'Shampoos, conditioners, and treatments' },
  { name: 'Fragrance', description: 'Perfumes and colognes' },
  { name: 'Body Care', description: 'Body lotions, scrubs, and treatments' },
  { name: 'Tools & Accessories', description: 'Beauty tools and accessories' }
]

categories_data.each do |cat_data|
  Category.find_or_create_by(name: cat_data[:name]) do |category|
    category.description = cat_data[:description]
  end
end

puts "Created #{Category.count} categories"

# Create Pages
Page.find_or_create_by(slug: 'about') do |page|
  page.title = 'About Us'
  page.content = <Welcome to Beauty Store
    We are your premier destination for high-quality beauty products.

    Our Mission
    To provide authentic, high-quality beauty products that enhance natural beauty.

    Why Choose Us?

      Authentic products from trusted brands
      Fast and reliable shipping
      Excellent customer service
      Competitive prices

  HTML
end

Page.find_or_create_by(slug: 'contact') do |page|
  page.title = 'Contact Us'
  page.content = <Get in Touch
    We'd love to hear from you!

    Email
    support@beautystore.com

    Phone
    1-800-BEAUTY-1

    Address
    123 Beauty LaneCosmetics City, BC V1A 2B3Canada
  HTML
end

puts "Created #{Page.count} pages"

# Create 10 Products
products_data = [
  {
    name: 'Hydrating Facial Serum',
    description: 'A lightweight hyaluronic acid serum that deeply hydrates and plumps skin, reducing the appearance of fine lines. Suitable for all skin types.',
    price: 45.99,
    brand: 'GlowLab',
    category: 'Skincare',
    on_sale: false,
    new_arrival: true
  },
  {
    name: 'Matte Liquid Lipstick - Ruby Red',
    description: 'Long-lasting matte liquid lipstick with rich pigmentation. Transfer-proof formula that stays put for up to 12 hours.',
    price: 18.50,
    brand: 'ColorPop',
    category: 'Makeup',
    on_sale: true,
    new_arrival: false
  },
  {
    name: 'Nourishing Hair Mask',
    description: 'Deep conditioning treatment enriched with argan oil and keratin. Repairs damaged hair and adds brilliant shine.',
    price: 32.00,
    brand: 'SilkStrands',
    category: 'Haircare',
    on_sale: false,
    new_arrival: false
  },
  {
    name: 'Luxury Eau de Parfum - Midnight Rose',
    description: 'An elegant floral fragrance with notes of rose, jasmine, and sandalwood. Long-lasting and sophisticated.',
    price: 89.99,
    brand: 'Essence Luxe',
    category: 'Fragrance',
    on_sale: false,
    new_arrival: true
  },
  {
    name: 'Vitamin C Brightening Cream',
    description: 'Powerful brightening cream with 15% vitamin C that fades dark spots and evens skin tone. Antioxidant-rich formula.',
    price: 52.00,
    brand: 'GlowLab',
    category: 'Skincare',
    on_sale: true,
    new_arrival: false
  },
  {
    name: 'Eyeshadow Palette - Sunset Dreams',
    description: '12-shade palette featuring warm neutrals and vibrant sunset tones. Highly pigmented with smooth blendability.',
    price: 42.00,
    brand: 'ColorPop',
    category: 'Makeup',
    on_sale: false,
    new_arrival: true
  },
  {
    name: 'Volumizing Shampoo',
    description: 'Sulfate-free shampoo that adds volume and body to fine, flat hair. Infused with biotin and collagen.',
    price: 24.99,
    brand: 'SilkStrands',
    category: 'Haircare',
    on_sale: false,
    new_arrival: false
  },
  {
    name: 'Exfoliating Body Scrub - Coconut',
    description: 'Gentle exfoliating scrub with coconut oil and sea salt. Removes dead skin cells and leaves skin silky smooth.',
    price: 28.00,
    brand: 'PureSpa',
    category: 'Body Care',
    on_sale: true,
    new_arrival: false
  },
  {
    name: 'Makeup Brush Set - Professional',
    description: '10-piece professional makeup brush set with synthetic bristles. Includes face and eye brushes in a travel case.',
    price: 65.00,
    brand: 'BeautyTools Pro',
    category: 'Tools & Accessories',
    on_sale: false,
    new_arrival: false
  },
  {
    name: 'Retinol Night Cream',
    description: 'Anti-aging night cream with retinol and peptides. Reduces wrinkles and improves skin texture while you sleep.',
    price: 58.00,
    brand: 'GlowLab',
    category: 'Skincare',
    on_sale: false,
    new_arrival: true
  }
]

products_data.each do |product_data|
  Product.find_or_create_by(name: product_data[:name]) do |product|
    product.description = product_data[:description]
    product.price = product_data[:price]
    product.brand = product_data[:brand]
    product.category = product_data[:category]
    product.on_sale = product_data[:on_sale]
    product.new_arrival = product_data[:new_arrival]
  end
end

puts "Created #{Product.count} products"
puts "Setup complete! Visit http://localhost:3000/admin"
puts "Admin login: admin@example.com / password"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?