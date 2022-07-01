class TwitterAccount < ApplicationRecord
  belongs_to :user

  validate :username, uniqueness: true
end
