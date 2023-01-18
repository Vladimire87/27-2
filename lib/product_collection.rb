# frozen_string_literal: true

# class
class ProductCollection
  PRODUCT_TYPES = {
    film: { dir: 'films', class: Movie },
    book: { dir: 'books', class: Book }
  }.freeze

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []
    PRODUCT_TYPES.each do |_type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]
      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.new_from_file(path)
      end
    end
    new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by!(&:to_s)
    when :price
      # Если запросили сортировку по цене
      @products.sort_by!(&:price)
    when :stock
      # Если запросили сортировку по количеству
      @products.sort_by!(&:stock)
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
    self
  end
end
