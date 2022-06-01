class WordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.product_option =~ /[a-z]+/
      record.errors.add attribute, (options[:message] || "atleast give word in option")
    end
  end
end