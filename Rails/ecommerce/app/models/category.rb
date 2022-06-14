class Category < ApplicationRecord
  validates :name , inclusion: {in: ["clothes", "electronics"]}
  validates :description, presence: true, if: :description?
  default_scope { where(description: true) }

  def description?
    description =~ /[\w]+/
  end

  has_many :products
  scope :cat, -> { where("description = 0.0 ") }
  scope :limit_num, ->(len = 1) {limit len}
end
  