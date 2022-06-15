class Customr < ApplicationRecord
#  with_options if: :name_valid? do |customer|
#    customer.validates :email_address, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})/ }
#  end
  has_many :orders, as: :orderable
  self.locking_column = :lock_customer
  has_one :wallet
  has_one :identification, through: :wallet
  
  after_touch :log_customer_touched

  private
    def log_customer_touched
      puts 'Customer/Wallet was touched'
    end

  def name_valid?
    !name.blank?
  end
end
