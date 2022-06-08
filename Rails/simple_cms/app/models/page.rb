class Page < ApplicationRecord
  has_many :paragraphs
  belongs_to :content
end
