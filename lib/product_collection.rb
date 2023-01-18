# frozen_string_literal: true

# class
class ProductCollection
  PRODUCT_TYPES = {
    film: { dir: 'films', class: Movie },
    book: { dir: 'books', class: Book },
    disk: { dir: 'disk', class: Disk }
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
    when :title then @products.sort_by!(&:to_s)
    when :price then @products.sort_by!(&:price)
    when :stock then @products.sort_by!(&:stock)
    when :type  then @products.sort_by! { |product| PRODUCT_TYPES.key(product.class) }
    end
    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc
    self
  end

  def cart
    # todo
  end
end
