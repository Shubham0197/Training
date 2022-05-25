class Flight < ApplicationRecord
  has_many :flights_aircrafts
  has_many :aircrafts, through: :flights_aircrafts
end

# one flight can have many aircrfts on that routes
