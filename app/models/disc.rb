class Disc < ApplicationRecord
    has_many :disc_plastics
    has_many :plastics, through: :disc_plastics
end
