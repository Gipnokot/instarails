# config/initializers/pagy.rb

# extras, которые есть в твоей версии pagy:
require "pagy/extras/overflow"
Pagy::DEFAULT[:overflow] = :empty_page

# по желанию задаём количество элементов на страницу:
Pagy::DEFAULT[:items]    = 20
