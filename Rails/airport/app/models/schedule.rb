class Schedule < ApplicationRecord
  belongs_to :flight
  belongs_to :aircraft
  belongs_to :employee
end
