class Owner < ApplicationRecord
    has_many :flowers
    has_many :floristries, through: :flowers

    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :user_name, presence: true
    validates :password, presence: true


end