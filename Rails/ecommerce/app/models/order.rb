class Order < ApplicationRecord
#  validates :customer_id, comparison: {greater_than: :product_id}
  validates :customer_id, comparison: {other_than: :product_id}
#  validates :customer_id, comparison: {lesser_than: :product_id}
#  validates :customer_id, comparison: {less_than_or_equal_to: :product_id}
#  validates :customer_id, comparison: {greater_than_or_equal_to: :product_id}
  validates :customer_id, exclusion: {in: [10,20,30],message: "%{value} not to be used"}
end