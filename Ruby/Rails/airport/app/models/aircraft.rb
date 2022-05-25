class Aircraft < ApplicationRecord
  has_many :flights_aircrafts
  has_many :flights, through: :flights_aircrafts
end
