class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.product_option.blank?
      record.errors.add :product_option, "Need a product option"
    end
  end
end
=begin
class WordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.product_option =~ /[a-z]+/
      record.errors.add attribute, (options[:message] || "atleast give word in option")
    end
  end
end
=end
class ProductOption < ApplicationRecord
  include ActiveModel::Validations
  validates_with MyValidator
  validates :product_option, Word: true 
  before_validation do 
    puts "Before validation"
  end

  after_validation do 
    product_option.upcase!
  end

  before_create do 
    puts "Hello before create here"
  end
 
  after_create :print_after
  private
    def print_after
      puts "Hello after create here"
    end

end

