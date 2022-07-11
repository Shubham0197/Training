class User < ApplicationRecord
  has_secure_password
  HOBBYS = %i[cricket badminton cod reading movies comics]
  
end
