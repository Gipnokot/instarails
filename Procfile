web: bin/rails server -p ${PORT:-3000} -e $RAILS_ENV
css: tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/tailwind.css --watch
worker: bundle exec sidekiq -C config/sidekiq.yml
release: bin/rails db:migrate && yarn build:css
