class Aircraft < ApplicationRecord
  include Validatable
  validates :name, presence: true
  has_many :certifieds, before_add: :check_ceritfieds
  has_many :schedules
  paginates_per 10

  def aborting
    throw :abort
  end
  def check_ceritfieds(certified)
    print "Before add association Callbacks"
    self.cruising_range += 100
  end

  def cruise?
    if self.cruising_range >= 1200
      return true
    end
    false
  end

end
