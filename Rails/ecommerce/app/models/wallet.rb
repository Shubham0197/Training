class Wallet < ApplicationRecord
  validates :name, presence: true
  validates :name, confirmation: {case_sensitive: false}
  validates :name_confirmation, presence: true
  validates :available, acceptance: {accept: 1 ,message: "Accept this"}
  validates :amount, confirmation: true
end
