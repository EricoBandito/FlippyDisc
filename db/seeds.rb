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
        price: Faker::Number.decimal(2),
        plastic: 'test',
        nova_speed: innova_disc['flight']['speed'],
        nova_glide: innova_disc['flight']['glide'],
        nova_turn: innova_disc['flight']['turn'],
        nova_fade: innova_disc['flight']['fade'],
        # image: 'innova_logo.png'
        )

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
                # image: 'discraft_logo.png'
                )

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

TaxRate.create(province: "Alberta", name: "GST", rate: 0.05)
TaxRate.create(province: "British Columbia", name: "PST", rate: 0.07)
TaxRate.create(province: "British Columbiaa", name: "GST", rate: 0.05)
TaxRate.create(province: "Manitoba", name: "PST", rate: 0.08)
TaxRate.create(province: "Manitoba", name: "GST", rate: 0.05)
TaxRate.create(province: "New-Brunswick", name: "HST", rate: 0.10)
TaxRate.create(province: "Newfoundland and Labrador", name: "HST", rate: 0.15)
TaxRate.create(province: "Northwest Territories", name: "GST", rate: 0.05)
TaxRate.create(province: "Nova Scotia", name: "HST", rate: 0.15)
TaxRate.create(province: "Ontario", name: "HST", rate: 0.13)
TaxRate.create(province: "Prince Edward Island", name: "HST", rate: 0.15)
TaxRate.create(province: "Quebec", name: "PST", rate: 0.09975)
TaxRate.create(province: "Quebec", name: "GST", rate: 0.05)
TaxRate.create(province: "Saskatchewan", name: "GST", rate: 0.05)
TaxRate.create(province: "Saskatchewan", name: "PST", rate: 0.06)
TaxRate.create(province: "Yukon	", name: "GST", rate: 0.05)

# TaxRate.create(province: "Alberta", :name "GST", :rate 0.05)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?