# frozen_string_literal: true

# class
class Disk < Product
  attr_accessor :title, :singer, :genre, :year

  def self.from_file(folder_path)
    Dir["#{folder_path}/*.txt"].map { |file| new_from_file(file) }
  end

  def self.new_from_file(file)
    lines = File.readlines(file, encoding: 'UTF-8').map(&:strip)
    new(
      title: lines[0],
      singer: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_f,
      stock: lines[5].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @singer = params[:singer]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Диск: «#{@title}», исполнитель - #{@singer}, жанр: #{genre} год: #{@year}, #{super}"
  end

  def update(params)
    @title = params[:title] if params[:title]
    @singer = params[:singer] if params[:singer]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
