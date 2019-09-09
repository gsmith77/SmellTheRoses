class FloristrySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :flowers
end
