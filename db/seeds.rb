# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# salt = "asdasdastr4325234324sdfds"
# crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("a", salt)
User.destroy_all
Project.destroy_all

# 10.times do |num|

#   User.create!({
#     first_name: "Homer#{num}",
#     last_name:  "Simpson",
#     email:      "homer#{num}@powerplant.org",
#     password:   "a",
#     password_confirmation: "a"
#     })
# end

user = User.create!({
    first_name: "ProtoParadigm",
    last_name:  ".",
    email:      "ProtoParadigm@powerplant.org",
    password:   "a",
    password_confirmation: "a"
    })

Project.create!({
   owner_id: user.id,
   title: "ProtoFlux - The First Magnetic Filament For Your 3D Printer",
   description: "Attract magnets and store data with ProtoFlux Magnetic Filament, a new ProtoTek 3D Printing Material.",
   picture: "https://s3.amazonaws.com/ksr/projects/1307182/photo-carousel.jpg"
  })
