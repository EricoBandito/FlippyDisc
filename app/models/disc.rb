class Disc < ApplicationRecord
    has_many :disc_plastics
    has_many :plastics, through: :disc_plastics

    def self.search(type, input = "")
        if input && type
            self.where("disc_type = ?", type).where("model like ?", "%#{input}%")
        elsif type
            self.where("disc_type = ?", type)
        elsif input
            self.where("model like ?", "%#{input}%")
        else
            Disc.all
        end
    end
end
