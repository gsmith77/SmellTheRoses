class Flower < ApplicationRecord
   belongs_to :owner
   belongs_to :floristry

   validates :name, presence: true
   validates :color, presence: true
end