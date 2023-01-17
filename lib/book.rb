# frozen_string_literal: true

# Для книги — название, жанр и автора
class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор - #{@author}, #{super}"
  end

  def update(params)
    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
