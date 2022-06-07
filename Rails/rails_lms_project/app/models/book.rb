class Book < ApplicationRecord
  has_and_belongs_to_many :writer, class_name: 'Author', validate: false, autosave: true
end
