# frozen_string_literal: true

# class
class Movie < Product
  attr_accessor :title, :year, :director

  def self.from_file(folder_path)
    Dir["#{folder_path}/*.txt"].map { |file| new_from_file(file) }
  end

  def self.new_from_file(file)
    lines = File.readlines(file, encoding: 'UTF-8').map(&:strip)
    new(
      title: lines[0],
      director: lines[1],
      year: lines[2].to_i,
      price: lines[3].to_f,
      stock: lines[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм «#{@title}», #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def from_file
    # todo
  end
end
