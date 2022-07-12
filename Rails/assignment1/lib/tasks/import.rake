require 'csv'
namespace :import do
  
  desc "Import Users from CSV"
  task users: :environment do
    counter = 0
    filename = File.join Rails.root, "users.csv"
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      user = User.where(email: row[:email]).first_or_initialize
      user.assign_attributes row.to_hash.slice(:last_name, :first_Name, :password)
      if user.save
        counter += 1
      else
        puts "#{row["Email"]} - #{user.errors.full_messages.join(",")}"
      end
    end

    puts "Imported #{counter} users"
  end
end