class User < ApplicationRecord
  validates :mobile_number, presence: {in: true, message: "NO cant be blank"}
end
