class Flight < ApplicationRecord
  has_many :schedules
  enum :status, [ :NotScheduled, :Scheduled, :Completed, :Cancelled ]

  validates :from, length: { minimum: 2 ,too_short: "%{count} characters is the maximum allowed" }, allow_nil: true
  validates :from, length: { maximum: 12 ,  too_long: "%{count} characters is the maximum allowed" }, strict: true
  validates :destination, length: { in: 2..12 }, allow_blank: true
  validates :price, numericality: {strict: true}
#  validates :from, uniqueness: {scope: :destination, case_sensitive: false}
  paginates_per 50
  before_update :ensure_cancelled_not_updated

  private
    def ensure_cancelled_not_updated
      if self.Cancelled?
        throw :abort
      end
    end

end

# one flight can have many aircrfts on that routes
