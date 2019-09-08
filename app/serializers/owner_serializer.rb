class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :user_name, :password
  has_many :flowers
end
