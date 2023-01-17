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

leon = Movie.new(price: 1990, units: 15, title: 'Леон', year: 1994, director: 'Люк Бессон')
idiot = Book.new(price: 599, units: 8, title: 'Идиот', genre: 'роман', author: 'Федор Достоевский')
fight_club = Movie.new(price: 1990, units: 15, title: 'Fight Club', year: 1999, director: 'David Fincher')
the_shining = Book.new(price: 599, units: 8, title: 'The Shining', genre: 'horror', author: 'Stephen King')
inception = Movie.new(price: 3000, units: 20, title: 'Inception', year: 2010, director: 'Christopher Nolan')
to_kill_a_mockingbird = Book.new(price: 499, units: 12, title: 'To Kill a Mockingbird', genre: 'drama',
                                 author: 'Harper Lee')
the_godfather = Movie.new(price: 2000, units: 15, title: 'The Godfather', year: 1972,
                          director: 'Francis Ford Coppola')
book1984 = Book.new(price: 399, units: 10, title: '1984', genre: 'dystopian', author: 'George Orwell')

puts leon.to_s
puts idiot.to_s
puts fight_club.to_s
puts the_shining.to_s
puts inception.to_s
puts to_kill_a_mockingbird.to_s
puts the_godfather.to_s
puts book1984.to_s

# book1984.price = 11999
# book1984.title = 'Книгатест'

# the_godfather.price = 11999
# the_godfather.title = 'Книгатест'

# puts
# puts book1984.to_s
# puts the_godfather.to_s