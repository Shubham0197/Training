class Aircraft < ApplicationRecord
  #self.primary_key = 'name'
  has_many :certifieds
  # validates :name, confirmation: true, unless: ->{ name.blank? }
  #validates :name_confirmation, presence: true, if: Proc.new {|aircraft| !aircraft.name.blank? }
  #validates :cruising_range, presence: true, unless: :cruising_range?
  
  #def cruising_range?
   # name.blank?
  #end

end
