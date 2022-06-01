class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.product_option.blank?
      record.errors.add :product_option, "Need a product option"
    end
  end
end

class WordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.product_option =~ /[a-z]+/
      record.errors.add attribute, (options[:message] || "atleast give word in option")
    end
  end
end

class ProductOption < ApplicationRecord
  include ActiveModel::Validations
  validates_with MyValidator
  validates :product_option, Word: true 
end
