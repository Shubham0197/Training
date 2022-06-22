class FlightsAircraft < ApplicationRecord
#  belongs_to :flight
#  belongs_to :aircraft
  after_commit PrintEmpty.new
end


