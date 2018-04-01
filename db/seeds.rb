10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.description = "the description for item #{counter}"
  item.category_id = counter
  item.save
  counter += 1
end

user1 = User.create! :name => 'John Doe', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
