# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
rest1 = Restaurant.create(name: "Completo XL", address: "estacion baquedano")
rest2 = Restaurant.create(name: "Fito", address: "Vicuna Maquena")
rest3 = Restaurant.create(name: "Burguery", address: "Av. del valle")
rest4 = Restaurant.create(name: "Aleman Experto", address: "Camino la fuente")

dish1 = Dish.create(name: "Desert")
dish2 = Dish.create(name: "Main course")
dish3 = Dish.create(name: "Appetizer")
dish4 = Dish.create(name: "Starter")
dish5 = Dish.create(name: "Salad")
dish6 = Dish.create(name: "Drink")

item1 = Item.create(name: "Burguer", price: 2500, callories: 700, restaurant: rest3, dish: dish2)
item2 = Item.create(name: "Completo", price: 750, callories: 1000, restaurant: rest1, dish: dish2)
item3 = Item.create(name: "Cesar Salad", price: 6000 , callories: 300, restaurant: rest4, dish: dish5)
item4 = Item.create(name: "Big Burguer", price: 4000 , callories: 1250 , restaurant: rest3, dish: dish2)
item5 = Item.create(name: "Tabla Cheese", price: 6500, callories: 500, restaurant: rest4, dish: dish3)
item6 = Item.create(name: "Papas fritas", price: 1000 , callories: 1000, restaurant: rest2, dish: dish3)
item7 = Item.create(name: "Shop 1Lt", price: 2000, callories: 200, restaurant: rest2, dish: dish6)


