source "https://rubygems.org"

# --- Main gems ---
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "sidekiq", "~> 8.0", ">= 8.0.3"
gem "pagy", "~> 9.3", ">= 9.3.4"

# --- Frontend ---
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sprockets-rails"
gem "tailwindcss-rails", "~> 4.2", ">= 4.2.3"

# --- Authorize and policies ---
gem "devise", "~> 4.9", ">= 4.9.4"
gem "pundit", "~> 2.5"

# --- Shrine and dependencies ---
gem "shrine", "~> 3.6"
gem "fastimage", "~> 2.4"
gem "mini_magick", "~> 5.2"
gem "image_processing", "~> 1.14"
gem "marcel", "~> 1.0", ">= 1.0.4"
gem "ruby-vips", "~> 2.2", ">= 2.2.3"

# --- Misc ---
gem "jbuilder"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[windows jruby]


group :development, :test do
  gem "dotenv-rails"
  gem "annotate"
  gem "bullet"
  gem "factory_bot_rails"
  gem "faker"
  # Debug
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false

  # RuboCop
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-factory_bot", require: false
end

group :development do
  gem "web-console"
  gem "rails_best_practices", require: false
  gem "letter_opener"
end

group :test do
  gem "rspec-rails", "~> 8.0"
  gem "capybara", ">= 3.39"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers", "~> 6.0"
  gem "database_cleaner-active_record"
  gem "simplecov", require: false
  gem "timecop"
  gem "rspec-sidekiq", "~> 5.1"
end
