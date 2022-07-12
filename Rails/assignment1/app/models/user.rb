class User < ApplicationRecord
  has_secure_password
  HOBBYS = %i[cricket badminton cod reading movies comics]
  validates :email, uniqueness: true

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      user = User.where(email: row[:email]).first_or_initialize
      user.assign_attributes row.to_hash.slice(:last_name, :first_Name, :password)
      if user.save
        counter += 1
      else
        puts "#{row["Email"]} - #{user.errors.full_messages.join(",")}"
      end
    end
    counter
  end

  def self.to_csv
    attributes = %w{id email first_name last_name}
    #shortcut to create array of strings
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end
end
