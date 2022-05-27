class Wallet < ApplicationRecord
  validates :name, presence: true
  validates :available, acceptance: {accept: 1 ,message: "Accept this"}
end
