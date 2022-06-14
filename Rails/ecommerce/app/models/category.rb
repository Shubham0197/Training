class Category < ApplicationRecord
  validates :name , inclusion: {in: ["clothes", "electronics"]}
  validates :description, presence: true, if: :description?

  def description?
    description =~ /[\w]+/
  end

  has_many :products
  scope :cat, -> { where("name is not null ") }
end
  