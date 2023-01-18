# frozen_string_literal: true

# product class
class Product
  attr_accessor :price, :stock

  def initialize(params)
    @price = params[:price]
    @stock = params[:stock]
  end

  def to_s
    "$#{@price.round(2)} (осталось #{stock})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @stock = params[:stock] if params[:stock]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
