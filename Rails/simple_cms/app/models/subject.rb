class Subject < ApplicationRecord

  has_many :pages, :dependent => :destroy
  validates :name, :presence => true, :length => {:maximum => 50}
  
end
