namespace :active_record_counter do
  desc "Total couunt of the employees"
  task employees_count: :environment do
    puts Employee.count
  end

  desc "Total count of the aircraft  "
  task aircraft_count: :environment do
    puts Aircraft.count
  end

end
