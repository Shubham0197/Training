class Product < ApplicationRecord
  validate do |product|
    if name == description
      errors.add :description, :too_plain, message: "is same as product"
    end
    if name.nil?
      errors.add :base, :invalid, message: "is invalid without name"     
    end
  end
end
