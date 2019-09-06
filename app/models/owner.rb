class Owner < ApplicationRecord
    has_many :flowers
    has_many :floristries, through: :flowers
end