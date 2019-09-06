class Floristry < ApplicationRecord
    has_many :flowers
    has_many :owners, through: :flowers
end

