class FlightsAircraft < ApplicationRecord
  belongs_to :flight
  belongs_to :aircraft
end
