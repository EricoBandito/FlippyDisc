class Disc < ApplicationRecord
    has_many :disc_plastics
    has_many :plastics, through: :disc_plastics
    accepts_nested_attributes_for :disc_plastics, allow_destroy: true

    validates :make, :model, :price, :disc_type, presence: true

    mount_uploader :image, ImageUploader

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
