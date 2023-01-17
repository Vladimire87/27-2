# frozen_string_literal: true

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'

# Пока функционал у нас очень простой, но фильм мы создать уже можем. Создадим
# новый товар — фильм за 990 рублей, и скажем, на складе их осталось 5 штук.
leon = Movie.new(price: 990, amount: 5)
book = Book.new(price: 1990, amount: 15)

# Просто чтобы не скучать выведем это в консоль
puts "Фильм Леон стоит #{leon.price} руб."
puts "Книга Деньги стоит #{book.price} руб."
