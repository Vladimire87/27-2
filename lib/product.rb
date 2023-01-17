# frozen_string_literal: true

# product class
class Product
  attr_reader :price, :units

  def initialize(params)
    @price = params[:price]
    @units = params[:units]
  end

  def to_s
    "#{@price} rub. (осталось #{units})"
  end
end
