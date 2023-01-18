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

current_path = File.dirname(__FILE__)

films = Movie.from_file("#{current_path}/data/films/")
books = Book.from_file("#{current_path}/data/books/")

puts films
puts
puts books

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
  Product.from_file("#{current_path}/data/films/01.txt")
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end
