class TaxRate < ApplicationRecord

    validates :province, :name, :rate, presence: true
end
