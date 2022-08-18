class Page < ApplicationRecord

  belongs_to :subject
  has_many :page_assignments
  has_many :users, :through => :page_assignments

  validates :name, :presence => true, :length => {:maximum => 50}

end
