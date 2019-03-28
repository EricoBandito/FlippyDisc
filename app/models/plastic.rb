class Plastic < ApplicationRecord
    has_many :disc_plastics
    has_many :disc, through: :disc_plastics

    validates :name, presence: true
end
