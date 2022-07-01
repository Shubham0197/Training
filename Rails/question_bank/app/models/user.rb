# email:string
# password_digest:string
#
# passsword:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password
  has_many :twitter_accounts
  has_many :tweets

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" } 
end
