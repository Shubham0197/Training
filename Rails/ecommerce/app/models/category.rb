class Category < ApplicationRecord
  validates :name , inclusion: {in: ["clothes", "electronics"]}
end
