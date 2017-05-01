source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rake'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem "haml-rails", "~> 0.9"

gem "figaro"

gem "stripe"
gem "stripe_event"
gem "money"
gem "domainatrix"

### forms
gem 'simple_form', "~> 3.4"
# Nested Model Forms
gem 'cocoon'

gem 'semantic-ui-sass', '~> 2.2', '>= 2.2.9.0'

gem 'mina-whenever', require: false
gem 'mina-scp', require: false
gem 'whenever', :require => false

#User login
gem 'devise'
gem 'devise_invitable', '~> 1.7.2'
gem 'omniauth-facebook', "~> 4.0.0"
gem "omniauth-google-oauth2"
gem 'omniauth-linkedin-oauth2'
gem 'omniauth-oauth2', '~> 1.3.1'
#Unique IDs
# gem 'activeuuid'  # https://github.com/jashmenn/activeuuid
gem 'activerecord-session_store'

gem 'react_webpack_rails'

#IMages
gem "paperclip", "~> 5.0.0"

gem 'annotate'

##
#Admin area
##
gem "administrate", "~> 0.3.0"
#Apparently administrate needs Bourbon: https://rails.devcamp.com/professional-rails-development-course/advanced-user-features/installing-admin-dashboard-rails-using-administrate-gem
gem 'bourbon'

# Use Mina for deployment
gem 'mina-whenever', require: false
gem 'mina-scp', require: false
gem 'whenever', :require => false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'meta_request'
  gem 'bullet'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'binding_of_caller'
  gem "better_errors"
  # http://stackoverflow.com/questions/21397648/getting-an-error-trying-to-route-a-page-rails-server
  gem 'progress_bar'  
end

group :production do 
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rwr-view_helpers'
