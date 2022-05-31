class Product < ApplicationRecord
  validates :name, length: { maximum: 12 }, on: :create
  validates :description, length: { maximum: 12 }, on: :account_setup
  validates :sku, length: { maximum: 4 }, on: :update
  
  validate do |product|
    if name == description
      errors.add :description, :too_plain, message: "is same as product"
    end
    if name.nil?
      errors.add :base, :invalid, message: "is invalid without name"     
    end
  end
end
