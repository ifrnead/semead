source 'https://rubygems.org'

gem 'font-awesome-rails'
gem 'bootstrap_form'
gem 'validates_cpf_cnpj'
gem 'validates'
gem "select2-rails"
gem 'cancancan', '~> 1.10'
gem "paperclip", "~> 5.0.0"
gem 'mercadopago-sdk'
gem 'rake', '11.2.2'
gem 'exception_notification'
gem 'whenever', :require => false
gem "nested_form"
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'ultrahook'
  gem 'rspec-rails', '~> 3.5'
  gem "factory_girl"
  gem "factory_girl_rails"
  gem 'cpf_faker'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem "capybara"
  gem 'cucumber-rails', :require => false
  gem "faker"
  gem 'poltergeist'
  # gem "guard-rspec"
  gem "launchy"
  gem "database_cleaner"
  gem 'capybara-select2', :github => 'goodwill/capybara-select2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
