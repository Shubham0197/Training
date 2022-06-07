class Product < ApplicationRecord
#  validate :name? , on: :create

  def name?
    if name.blank?
      errors.add(:name, "Name can't be blank")
    end
  end
  has_many :orders, as: :orderable  
  belongs_to :category
end