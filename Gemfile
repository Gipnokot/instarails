source "https://rubygems.org"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "pundit", "~> 2.5"
gem "devise", "~> 4.9", ">= 4.9.4"
gem 'tailwindcss-rails', '~> 4.2', '>= 4.2.3'
gem "shrine", "~> 3.6"
gem "fastimage", "~> 2.4"
gem "mini_magick", "~> 5.2"
gem "image_processing", "~> 1.14"
gem "marcel", "~> 1.0", ">= 1.0.4"
gem "ruby-vips", "~> 2.2", ">= 2.2.3"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem 'annotate'
  gem 'bullet'
  gem 'factory_bot_rails'
  gem 'faker'
  
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-performance", require: false
end

group :development do
  gem "web-console"
  gem 'rails_best_practices', require: false
end

group :test do
  gem 'rspec-rails', '~> 6.1'
  gem 'capybara', '>= 3.39'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'database_cleaner-active_record'
  gem 'simplecov', require: false
  gem 'timecop'
end
