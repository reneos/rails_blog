# README
This is a little blogging application written in Rails. 

## Features
- The blog can have multiple authors contributing posts. 
- Posts can have rich text editing thanks to TinyMCE (table formatting, highlights, and others in addition to standard bold, italicize, etc.).
- Posts can be tagged by multiple tags. 
- Posts can be searched through (title and body) via keywords, or they can be filtered by tags
- Posts can be set to asynchronously publish automatically in the future using Redis and Sidekiq
- Users have a dashboard where they can administrate their own posts 
- Authors can only edit and update their own posts, however admin users have access to all posts (See below for a rake task for creating admin users) 
- Comments can be added to posts (commenters do not need to create an account). 

## Ruby version
Ruby 2.6.6, Rails 6.0.3.2

## Used
- RSpec and Capybara for testing
- Sidekiq for asynch background jobs
- Devise/Pundit for users
- TinyMCE for rich text editing

## Database initialization
```
rake db:create
rake db:migrate
rake db:seed # Creates some dummy posts for testing as well as a few test users
```

## How to run the test suite
```
rake
```

## Create an admin user
You can quickly create a new admin user using a rake task:
```
rake create_admin USERNAME EMAIl PASSWORD
```
