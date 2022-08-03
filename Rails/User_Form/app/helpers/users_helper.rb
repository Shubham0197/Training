module UsersHelper
  require 'date'

  def age(object)
    if object.date_of_birth
      date_of_birth = object.date_of_birth
      today = Date.today
      age = today.year - date_of_birth.year
      age -= 1 if date_of_birth.strftime("%m%d").to_i > today.strftime("%m%d").to_i
      age
    else
      "NA"
    end
  end

end
