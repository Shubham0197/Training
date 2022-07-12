require 'csv'
namespace :import do
  
  desc "Import Users from CSV"
  task users: :environment do
    counter = 0
    filename = File.join Rails.root, "users.csv"
    CSV.foreach(filename) do |row|
      email, password, first, last = row
      user = User.create(email: email, first_name: first, last_name: last, password: password)
      counter += 1 if user.persisted?
      puts "#{email} - #{user.errors.full_messages.join(",")}" if user.errors.any?
    end

    puts "Imported #{counter} users"
  end
end