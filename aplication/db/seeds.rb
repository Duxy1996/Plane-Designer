# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

engines = [
  [ "Trent 500", "249.1","12","Rolls-Royce","180","Airbus A340","2.47","5000" ],
  [ "Trent 600", "249.1","12","Rolls-Royce","180","Airbus A340","2.47","5000" ],
  [ "Trent 700", "320.3","12","Rolls-Royce","180","Airbus A330","2.47","5000" ],
  [ "Trent 80A", "333.6","12","Rolls-Royce","180","Boeing 777","2.79","5000" ],
  [ "Trent 80B", "422.5","12","Rolls-Royce","180","Boeing 777","2.79","5000" ],
  [ "Trent 90A", "311.3","12","Rolls-Royce","180","Airbus A380","2.95","6271" ],
  [ "Trent 90B", "355.3","12","Rolls-Royce","180","Airbus A380","2.95","6271" ],
  [ "Trent 100A", "240.6","12","Rolls-Royce","180","Boeing 787","2.85","5765" ],
  [ "Trent 100B", "330.6","12","Rolls-Royce","180","Boeing 787","2.85","5765" ],
  [ "Trent XWB", "413.6","12","Rolls-Royce","180","Airbus A350","3.00","5000" ]
]

engines.each do |name, power, fuel_consumption, brand, etops, plane, diameter, mass|
  Engine.find_or_create_by( name: name, power: power, fuel_consumption: fuel_consumption, brand: brand, etops: etops, plane: plane, diameter: diameter, mass:mass)
end

category_list = [
  [ "Ala alta", "bueno para militar" ],
  [ "Ala baja", "bueno vuelos cortos" ],
  [ "Ala media", "bueno para vuelos comerciales" ]
]
category_list.each do |name, description|
  Category.find_or_create_by( name: name, description: description)
end

