class User < ApplicationRecord

  has_and_belongs_to_many :departments
  has_many :page_assignments
  has_many :pages, :through => :page_assignments
  validates :first_name, :presence => true, :length => {:maximum => 25}
  validates :last_name, :presence => true, :length => {:maximum => 50}
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :email, :presence => true,
                    :length => {:maximum => 100},
                    :format => {:with => EMAIL_REGEX},
                    :confirmation => true
end
