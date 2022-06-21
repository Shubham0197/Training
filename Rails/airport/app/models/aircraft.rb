class Aircraft < ApplicationRecord
  #self.primary_key = 'name'
  before_create :aborting
  has_many :certifieds, before_add: :check_ceritfieds
  # validates :name, confirmation: true, unless: ->{ name.blank? }
  #validates :name_confirmation, presence: true, if: Proc.new {|aircraft| !aircraft.name.blank? }
  #validates :cruising_range, presence: true, unless: :cruising_range?
  
  #def cruising_range?
   # name.blank?
  #end
  def aborting
    throw :abort
  end
  def check_ceritfieds(certified)
    print "Before add association Callbacks"
    self.cruising_range += 100
  end

end
