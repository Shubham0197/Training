class Flight < ApplicationRecord
  has_many :aircrafts
end

# one flight can have many aircrfts on that routes
