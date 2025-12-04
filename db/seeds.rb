puts "Creating 10 products..."

products = [
  {
    name: "Hydrating Face Cream",
    brand: "GlowBeauty",
    price: 29.99,
    description: "A lightweight daily moisturizer infused with hyaluronic acid and vitamin E. Provides long-lasting hydration while improving skin texture for a soft, radiant glow."
  },
  {
    name: "Vitamin C Brightening Serum",
    brand: "Pure Radiance",
    price: 34.99,
    description: "A potent 10% vitamin C serum that reduces dark spots, boosts collagen, and evens out skin tone. Suitable for all skin types."
  },
  {
    name: "Deep Repair Hair Mask",
    brand: "SilkEssence",
    price: 24.50,
    description: "A nourishing hair mask enriched with keratin and argan oil that restores damaged hair, reduces frizz, and enhances natural shine."
  },
  {
    name: "Velvet Matte Lipstick – Rosewood",
    brand: "LuxeColor",
    price: 18.00,
    description: "A long-lasting matte lipstick with intense pigment and a smooth, non-drying formula. The Rosewood shade complements all skin tones."
  },
  {
    name: "Aloe & Chamomile Cleanser",
    brand: "FreshGlow",
    price: 16.99,
    description: "A gentle foaming cleanser formulated with aloe vera and chamomile extract to soothe and refresh sensitive skin."
  },
  {
    name: "Volumizing Mascara – Blackest Black",
    brand: "LashLift Pro",
    price: 19.99,
    description: "Provides dramatic volume and length without clumping. Enriched with conditioning peptides for healthier lashes."
  },
  {
    name: "Hydrating Body Lotion – Vanilla Blossom",
    brand: "PureMist",
    price: 14.99,
    description: "A silky, fast-absorbing body lotion infused with shea butter and a soft vanilla blossom scent for all-day moisture."
  },
  {
    name: "Exfoliating Sugar Scrub – Coconut Lime",
    brand: "NatureSkin",
    price: 12.50,
    description: "Gently exfoliates dead skin cells using natural sugar crystals while hydrating with coconut oil and refreshing lime extract."
  },
  {
    name: "SPF 50 Lightweight Sunscreen",
    brand: "SunCare+",
    price: 21.99,
    description: "A non-greasy, fast-absorbing sunscreen offering broad-spectrum UVA/UVB protection. Perfect for daily wear under makeup."
  },
  {
    name: "Detox Green Clay Mask",
    brand: "HerbalGlow",
    price: 17.99,
    description: "A clarifying mask made with French green clay, tea tree oil, and botanical extracts that detoxifies pores and reduces excess oil."
  }
]

products.each do |product|
  Product.create!(
    name: product[:name],
    brand: product[:brand],
    price: product[:price],
    description: product[:description],
    category_id: Category.all.sample.id # assigns random category
  )
end

puts "10 products created!"