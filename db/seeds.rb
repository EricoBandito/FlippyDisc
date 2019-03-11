# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

path = File.join Rails.root, 'public'
discraft_list = JSON.parse(File.read( path + '/discraft.json'))
innova_list = JSON.parse(File.read( path + '/innova.json'))


discraft_list.each do |discraft_disc|
    Disc.create(make: "Discraft",
                model: discraft_disc['name'],
                disc_type: discraft_disc['class'],
                plastic: 'test',
                dc_flight: discraft_disc['flight'],
                nova_speed: 1,
                nova_glide: 1,
                nova_turn: 1,
                nova_fade: 1)
end