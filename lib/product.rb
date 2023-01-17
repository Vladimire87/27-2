# frozen_string_literal: true

# product class
class Product
  attr_accessor :price, :units

  def initialize(params)
    @price = params[:price]
    @units = params[:units]
  end

  def to_s
    "#{@price} rub. (осталось #{units})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @units = params[:units] if params[:units]
  end
end
