class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
         
  include Validatable
  has_many :certifieds
  has_many :trainee, class_name: "Employee" , foreign_key: "trainer_id"
  belongs_to :trainer, class_name: "Employee", optional: true
  before_destroy :delete_from_certified
  after_destroy_commit :check
  has_one_attached :image
  has_rich_text :content
  paginates_per 50
  
  def delete_from_certified
    print "before destory"
    self.certifieds.clear
  end
  def check
    print "After destroy Commit",self.certifieds.empty?
   end
end
