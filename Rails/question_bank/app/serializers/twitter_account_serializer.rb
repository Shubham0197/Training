class TwitterAccountSerializer < ActiveModel::Serializer
  attributes :user_id, :name, :username
end
