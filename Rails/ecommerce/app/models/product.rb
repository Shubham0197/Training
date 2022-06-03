class Product < ApplicationRecord
  validate :name? , on: :create

  def name?
    if name.blank?
      errors.add(:name, "Name can't be blank")
    end
  end
  
  belongs_to :category
end