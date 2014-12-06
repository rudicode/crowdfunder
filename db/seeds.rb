# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Reward.destroy_all
Pledge.destroy_all
Project.destroy_all

User.create!({
      first_name: "a",
      last_name:  "a",
      email:      "a",
      password:   "a",
      password_confirmation: "a"
      })

urls = [
"https://s3.amazonaws.com/ksr/projects/1307182/photo-carousel.jpg",
"https://s3.amazonaws.com/ksr/projects/1430513/photo-carousel.jpg",
"https://s3.amazonaws.com/ksr/projects/1252028/photo-carousel.jpg",
"https://s3.amazonaws.com/ksr/projects/914389/photo-carousel.jpg",
"https://s3.amazonaws.com/ksr/projects/1420032/photo-carousel.jpg",
"https://s3.amazonaws.com/ksr/projects/1475293/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1014954/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1376382/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1515743/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1452552/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1489223/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1522779/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1340592/photo-ed.jpg",
"https://s3.amazonaws.com/ksr/projects/1397635/photo-ed.jpg"

]

urls.each_with_index do |url,count|

  user = User.create!({
      first_name: "ProtoParadigm#{count}",
      last_name:  ".",
      email:      "ProtoParadigm#{count}@powerplant.org",
      password:   "a",
      password_confirmation: "a"
      })

  project = Project.create!({
     owner_id: user.id,
     goal: 6000,
     start_date: Time.now,
     finish_date:   Time.now + 30.days,
     title: "ProtoFlux#{count} - The First Magnetic Filament For Your 3D Printer",
     description: "#{count} Attract magnets and store data with ProtoFlux Magnetic Filament, a new ProtoTek 3D Printing Material.",
     picture: url
    })

  6.times do |index|
    Reward.create!({
      min_amount: 500 * (index+1),
      description: "Reward #{index+1}",
      project_id: project.id
      })
  end
end

Pledge.create!({
  amount: Reward.last.min_amount,
  project_id: Project.last.id,
  user_id: Project.last.owner.id

  })
