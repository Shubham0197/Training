class Wallet < ApplicationRecord
#  validates :name, presence: true, on: :update
#  validates :name, confirmation: {case_sensitive: false}
#  validates :name_confirmation, presence: true, if: ->{!name.blank?}
#  validates :available, acceptance: {accept: 1 ,message: "Accept this"}
#  validates :amount, confirmation: true, numericality: {greater_than: 90}
#  belongs_to :customr, touch: true
  has_one :identification
  before_save :printing , if: :name?, unless: Proc.new{ walllet?}
  after_update :printing, if: [:name?, :walllet?]
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
#  before_destroy :printing
  around_destroy :around_callbacks
#  after_destroy  :printing
=begin
  after_initialize do |wallet|
    wallet.amount = 100
    print "after initialize", amount, "\n"
  end

  after_find do |wallet|
    wallet.amount = 0
    print "after find", amount, "\n"
  end
=end
  after_touch do |wallet|
    puts "call back touch"
  end


  def printing
    print "Callback  run here \n "
  end

  def around_callbacks
    print "Before yield "
    print amount
    yield
    print "after yield "
    print amount
  end

  def name?
    if name.blank?
      false
    else
      true
    end
  end

  def walllet? 
    if amount > 0
      true
    else
      false
    end
  end


  def transaction (amount)
    print amount, "deducted"
  end
end


