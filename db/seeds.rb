# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.new(name: 'Test Account', email: 'test@mail.com', password: 'password')
u1.save

# u2 = User.new(name: 'Test', email: 'test@asd.com', password: '123456')
# u2.save

# User 1 Categories

Category.create(user_id: u1.id, name: 'Leisure', icon: 'https://img.freepik.com/free-vector/banner-with-flowing-liquid-shapes_1142-9323.jpg?w=740&t=st=1685551646~exp=1685552246~hmac=f612502f1783cc248cd191d538b7223803ffc28f1e50a8719749e7e86b3a0750' )
Category.create(user_id: u1.id, name: 'Groceries', icon: 'https://img.freepik.com/free-vector/abstract-colorful-flow-shapes-background_23-2148247306.jpg?t=st=1685575785~exp=1685576385~hmac=59b303469c601b68144d1ef79ce6272f004677d833eed036a4df7eabeecf7d4a' )
Category.create(user_id: u1.id, name: 'Investment', icon: 'https://img.freepik.com/free-vector/colorful-abstract-background_23-2148446024.jpg?t=st=1685575789~exp=1685576389~hmac=753780831b427b029b53fbb271bab90005ce56a68d27f5497292eb01144c0606' )
Category.create(user_id: u1.id, name: 'Rent', icon: 'https://img.freepik.com/free-vector/abstract-colorful-flowing-shapes-background_52683-17743.jpg?t=st=1685575819~exp=1685576419~hmac=d0e55d48c9c135109d205d941e4a33802064d47cca3193a0603d98efdd51fbb2' )


# User 2 Categories

# Category.create(user: u2, name: 'Travel', icon: 'https://images.pexels.com/photos/4353813/pexels-photo-4353813.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
# Category.create(user: u2, name: 'Entertainment', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
# Category.create(user: u2, name: 'Debt', icon: 'https://images.pexels.com/photos/47344/dollar-currency-money-us-dollar-47344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )