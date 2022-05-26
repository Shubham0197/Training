class Wallet < ApplicationRecord
  validates :name, presence: true
end
