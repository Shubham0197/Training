class Wallet < ApplicationRecord
#  validates :name, presence: {strict: true}, on: :update
#  validates :name, confirmation: {case_sensitive: false}
#  validates :name_confirmation, presence: true, if: ->{!name.blank?}
#  validates :available, acceptance: {accept: 1 ,message: "Accept this"}
#  validates :amount, confirmation: true, numericality: {greater_than: 90}
#  belongs_to :customr
  has_one :identification
#  before_save :printing
#  around_save :printing
#  before_create :printing
#  around_create :printing
#  after_create :printing
#  after_save :printing
#  after_commit :printing
#  after_rollback :printing
#  before_update :printing
#  around_update :printing
#  after_update :printing
  before_destroy :printing
  around_destroy :around_callbacks
#  after_destroy  :printing
  
  

  def printing
    print "Callback for destroy run here \n "
  end

  def around_callbacks
    print "Before yield "
    print amount
    yield
    print "after yield "
    print amount
  end

  def transaction (amount)
    print amount, "deducted"
  end
end


