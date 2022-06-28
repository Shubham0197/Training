class Flight < ApplicationRecord
  validates :from, length: { minimum: 2 ,too_short: "%{count} characters is the maximum allowed" }, allow_nil: true
  validates :from, length: { maximum: 12 ,  too_long: "%{count} characters is the maximum allowed" }, strict: true
  validates :destination, length: { in: 2..12 }, allow_blank: true
  validates :price, length: { is: 5, wrong_length: "you gave wrong length" }
  validates :price, numericality: {strict: true}
  validates :price, numericality: {in: 10000..59999, other_than: 29999}
#  validates :from, uniqueness: {scope: :destination, case_sensitive: false}
  paginates_per 50
end

# one flight can have many aircrfts on that routes
