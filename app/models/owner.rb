class Owner < ApplicationRecord
    has_many :flowers
    has_many :floristries, through: :flowers

    has_secure_password
    validates :first_name, presence: true, uniqueness: true
    validates :last_name, presence: true, uniqueness: true
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: true


end