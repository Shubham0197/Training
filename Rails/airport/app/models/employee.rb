class Employee < ApplicationRecord
  has_many :certifieds
  has_many :trainee, class_name: "Employee" , foreign_key: "trainer_id"
  belongs_to :trainer, class_name: "Employee", optional: true
  before_destroy :delete_from_certified
  after_destroy_commit :check

  def delete_from_certified
    print "before destory"
    self.certifieds.clear
  end
  def check
    print "After destroy Commit",self.certifieds.empty?
   end
end
