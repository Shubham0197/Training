class Category < ApplicationRecord
  validates :name , inclusion: {in: ["clothes", "electronics"]}
  validates :description, absence: true
end
