require 'csv'
namespace :import do
  
  desc "Import Users from CSV"
  task users: :environment do
    counter = 0
    filename = File.join Rails.root, "users.csv"
    CSV.foreach(filename, headers: true) do |row|
      p row
      p row["Email"]
      #  email, password, first, last = row
      user = User.create(email: row["Email"], first_name: row["First_Name"], last_name: row["Last_Name"], password: row["Password"])
      counter += 1 if user.persisted?
      puts "#{row["Email"]} - #{user.errors.full_messages.join(",")}" if user.errors.any?
    end

    puts "Imported #{counter} users"
  end
end