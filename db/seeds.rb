
puts 'Destroying all posts and users'

Post.destroy_all
User.destroy_all

puts 'Creating 6 users'

%w[nicole kyle tom mary bob jenny].each do |name|
  User.create!(
    username: name,
    email: Faker::Internet.free_email(name: name),
    password: 'password'
  )
end

puts 'Created 6 users'

images = [
  'https://images.unsplash.com/photo-1551739440-5dd934d3a94a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80',
  'https://images.unsplash.com/photo-1516542076529-1ea3854896f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80',
  'https://images.unsplash.com/photo-1593642703055-4b72c180d9b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  'https://images.unsplash.com/photo-1535957998253-26ae1ef29506?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1276&q=80',
  'https://images.unsplash.com/photo-1483389127117-b6a2102724ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80'
]

puts 'Creating 30 published posts....'

30.times do
  post = Post.create(
    title: [Faker::Hacker.ingverb, Faker::Hacker.adjective, Faker::Hacker.noun].map(&:capitalize).join(' '),
    user: User.all.sample,
    content: (0..5).map { |_e| Faker::Hacker.say_something_smart }.join(' '),
    publish_date: Date.today - rand(0..7),
    is_published: true,
    tag_list: (0..rand(0..3)).map { |_e| Faker::Hacker.noun }.join(', ')
  )
  if images.any?
    file = URI.open(images.pop)
    post.photo.attach(io: file, filename: 'blog_image.jpg', content_type: 'image/jpg')
    post.save!
  end
end

puts 'Created 30 posts.'

puts 'Creating 15 unpublished posts....'

15.times do
  Post.create(
    title: "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    user: User.all.sample,
    content: (0..5).map { |_e| Faker::Hacker.say_something_smart }.join(' '),
    publish_date: Date.today - rand(0..7),
    is_published: false,
    tag_list: (0..rand(0..3)).map { |_e| Faker::Hacker.noun }.join(', ')
  )
end

puts 'Created 15 unpublished posts.'

puts 'Creating 30 comments on published posts...'

30.times do
  post = Post.published.sample
  Comment.create!(
    name: Faker::Internet.username,
    content: Faker::Hacker.say_something_smart,
    post: post
  )
end

puts 'Created 30 comments'
