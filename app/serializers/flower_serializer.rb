class FlowerSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :owner_id, :floristry_id
end
