# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Create an admin: username email password"
task :create_admin do
  ARGV.each { |a| task a.to_sym do ; end }
  puts "username: #{ARGV[1]}"
  puts "email: #{ARGV[2]}"
  puts "Admin user created successfully" if User.create!(
    username: ARGV[1],
    email: ARGV[2],
    password: ARGV[3],
    admin: true
  )
end

desc "Publish scheduled posts"
task :publish_scheduled_posts => :environment do
  puts "Publishing scheduled posts"
  Post.publish_scheduled_posts
end
