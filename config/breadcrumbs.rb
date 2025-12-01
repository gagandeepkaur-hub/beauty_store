crumb :root do
  link "Home", root_path
end

crumb :products do
  link "Products", products_path
end

crumb :product do |product|
  link product.name, product_path(product)
  parent :products
end

crumb :cart do
  link "Shopping Cart", cart_path
end

crumb :checkout do
  link "Checkout", new_order_path
  parent :cart
end

crumb :orders do
  link "My Orders", orders_path
end

crumb :order do |order|
  link "Order ##{order.id}", order_path(order)
  parent :orders
end

crumb :page do |page|
  link page.title, page_path(page.slug)
end