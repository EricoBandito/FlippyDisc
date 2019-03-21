class Disc < ApplicationRecord
    has_many :disc_plastics
    has_many :plastics, through: :disc_plastics

    def self.search(type)
        if type
            self.where("disc_type = ?", type)
        else
            Disc.all
        end
    end
end
