class Content < ApplicationRecord
  has_many :pages
  has_many :paragraphs, through: :pages
end
