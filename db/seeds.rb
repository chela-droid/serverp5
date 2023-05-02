# # # create some categories
#  Category.create(name: "Electronics")
#  Category.create(name: "Clothing")
#  Category.create(name: "kitchen ware")
#  Category.create(name: "Beauty Products")

# # # create some users
#  User.create(name: "John Doe", email: "johndoe@example.com", phone_number: "123-456-7890", username: "johndoe", password: "password")
#  User.create(name: "Jane Smith", email: "janesmith@example.com", phone_number: "555-555-5555", username: "janesmith", password: "password")

# # # create some products
#  Product.create(title: "iPhone X", description: "The latest iPhone", quantity: 10, price: 999, category_id: 1)
#  Product.create(title: "Men's T-Shirt", description: "A comfortable t-shirt for men", quantity: 50, price: 25, category_id: 2)
#  Product.create(title: "Glass set", description: "come with one pitcher and 6 glasses", quantity: 12, price: 1200, category_id: 3)
#  Product.create(title: "Make-Up Set", description: "lipsticks,brushes,eyeshadow", quantity: 20, price: 799, category_id: 4)

# # # create some reviews
#  Review.create(star_rating: 4, comment: "Great product!", user_id: 1, product_id: 1)
#  Review.create(star_rating: 3, comment: "Decent shirt", user_id: 2, product_id: 2)

# # # create some addresses
#  Address.create(city: "New York", address: "123 Main St", user_id: 1, region: "NY",saved: false)
#  Address.create(city: "San Francisco", address: "456 Elm St", user_id: 2, region: "CA", saved: true)

# # # create an admin
#  Admin.create(name: "Admin User", email: "admin@example.com", username: "admin", password: "password")

# # # create some orders
#  Order.create(product_id: 1, user_id: 1, quantity: 1, price: 999)
#  Order.create(product_id: 2, user_id: 2, quantity: 2, price: 50)

# charts data
Chart.create(name: "Clothing", sales: 5800, customers: 2400)
Chart.create(name: "Electronics", sales: 4300, customers: 1398)
Chart.create(name: "Utensils", sales: 2000, customers: 9800)
Chart.create(name: "Kitchen-Ware", sales: 9900, customers: 3908)
Chart.create(name: "Glasses", sales: 7600, customers: 4800)
Chart.create(name: "Beauty Products", sales: 4200, customers: 3800)
Chart.create(name: "", sales: 0, customers: 0)


puts 'done seeded'