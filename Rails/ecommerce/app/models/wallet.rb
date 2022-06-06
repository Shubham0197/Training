class Wallet < ApplicationRecord
#  validates :name, presence: {strict: true}, on: :update
#  validates :name, confirmation: {case_sensitive: false}
#  validates :name_confirmation, presence: true, if: ->{!name.blank?}
#  validates :available, acceptance: {accept: 1 ,message: "Accept this"}
#  validates :amount, confirmation: true, numericality: {greater_than: 90}
  belongs_to :customr
end


