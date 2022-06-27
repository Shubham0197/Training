namespace :custom do
  desc 'Create custom rake task to greeting message.'

  task greet_the_user: :environment do
    puts "Hello to the Airport project"
  end
end