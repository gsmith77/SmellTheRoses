class Flower < ApplicationRecord
   belongs_to :owner
   belongs_to :floristry

   validates :name, presence: true
   validates :description, presence: true


end