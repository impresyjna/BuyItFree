# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OrderState.delete_all
OrderState.create! id: 1, name: "Nieaktywne"
OrderState.create! id: 2, name: "Do skompletowania"
OrderState.create! id: 3, name: "Skompletowane"
OrderState.create! id: 4, name: "Wysłane"
OrderState.create! id: 5, name: "Anulowane"

Category.delete_all
Category.create! id: 1, name: "Elektronika"
Category.create! id: 2, name: "Ubrania"
Category.create! id: 3, name: "Książki"
Category.create! id: 4, name: "Perfumy"
Category.create! id: 5, name: "Fotografia"
Category.create! id: 6, name: "Rękodzieło"
Category.create! id: 7, name: "Sport"
