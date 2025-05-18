web: bundle exec puma -C config/puma.rb
css: tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/tailwind.css --watch
worker: bundle exec sidekiq -C config/sidekiq.yml
