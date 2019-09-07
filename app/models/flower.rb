class Flower < ApplicationRecord
   belongs_to :owner
   belongs_to :floristry

   validates :name, presence: false
end