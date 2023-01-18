# frozen_string_literal: true

# Для книги — название, жанр и автора
class Book < Product
  attr_accessor :title, :author, :year

  def self.from_file(folder_path)
    Dir["#{folder_path}/*.txt"].map { |file| new_from_file(file) }
  end

  def self.new_from_file(file)
    lines = File.readlines(file, encoding: 'UTF-8').map(&:strip)
    new(
      title: lines[0],
      author: lines[1],
      year: lines[2].to_i,
      price: lines[3].to_f,
      stock: lines[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @author = params[:author]
  end

  def to_s
    "Книга: «#{@title}», автор - «#{@author}», #{super}"
  end

  def update(params)
    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @author = params[:author] if params[:author]
  end
end
