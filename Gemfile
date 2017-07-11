source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.4'

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'friendly_id'
gem 'haml-rails'
gem 'obscenity'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rails', '~> 5.0.2'
gem 'redis'
gem 'rubocop'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "byebug", platform: :mri
  gem "erb2haml"
  gem 'pry'
  gem "spring"
end

group :development do
  gem 'awesome_print'
  gem 'bullet'
  gem 'erb2haml'
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "fuubar"
  gem "launchy"
  gem "poltergeist"
  gem "rr"
  gem "rspec"
  gem "rspec-its"
  gem "rspec-rails"
  gem "shoulda-matchers", "~> 2.0"
  gem "webmock", require: false
  gem "wrong", github: "sconover/wrong"
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
