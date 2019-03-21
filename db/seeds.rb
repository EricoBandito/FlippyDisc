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


innova_list.each do |innova_disc|
    disc = Disc.create(make: "Innova",
        model: innova_disc['name'],
        disc_type: innova_disc['class'],
        plastic: 'test',
        nova_speed: innova_disc['flight']['speed'],
        nova_glide: innova_disc['flight']['glide'],
        nova_turn: innova_disc['flight']['turn'],
        nova_fade: innova_disc['flight']['fade'],
        image: 'innova_logo.png')

        innova_disc['plastic'].each do |plastic|



            if Plastic.exists?(:name => plastic)
                plastic_id  = Plastic.find_by(name: plastic).id
                DiscPlastic.create(disc_id: disc.id,
                                    plastic_id: plastic_id)
            else
                plastic = Plastic.create(name: plastic)
                DiscPlastic.create(disc_id: disc.id,
                                    plastic_id: plastic_id)
            end
        end

end

discraft_list.each do |discraft_disc|
    disc = Disc.create(make: "Discraft",
                model: discraft_disc['name'],
                disc_type: discraft_disc['class'],
                plastic: 'test',
                dc_flight: discraft_disc['flight'],
                image: 'discraft_logo.png')

    discraft_disc['plastic'].each do |plastic|



        if Plastic.exists?(:name => plastic)
            plastic_id  = Plastic.find_by(name: plastic).id
            DiscPlastic.create(disc_id: disc.id,
                                plastic_id: plastic_id)
        else
            plastic = Plastic.create(name: plastic)
            DiscPlastic.create(disc_id: disc.id,
                                plastic_id: plastic_id)
        end
    end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?