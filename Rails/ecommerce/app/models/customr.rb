class Customr < ApplicationRecord
  validates :email_address, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})/ }
end
