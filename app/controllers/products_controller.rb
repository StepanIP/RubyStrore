# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @categories = Product.select(:category).distinct
    @products = Product.all

    @products = Product.paginate(page: params[:page], per_page: 3)

    if params[:search].present?
      @products = @products.where('name LIKE ?', "%#{params[:search]}%")
    end

    if params[:category].present?
      @products = @products.where(category: params[:category])
    end
  end

  def new
    @product = Product.new
  end

  def create
    if params[:product][:photo_path].present?
      uploaded_image = params[:product][:photo_path]

      # Директорія для завантаження
      image_directory = Rails.root.join('app', 'assets', 'images', 'products')
      FileUtils.mkdir_p(image_directory) unless File.directory?(image_directory)

      # Збереження оригінального імені файлу
      filename = uploaded_image.original_filename
      image_path = image_directory.join(filename)

      # Запис файлу на диск
      File.open(image_path, 'wb') do |file|
        file.write(uploaded_image.read)
      end

      Rails.logger.info "Saving to photo_path: #{filename}"

      # Оновлення параметрів продукту
      params[:product][:photo_path] = "products/#{filename}"
    end

    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end
    def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo_path, :category, :color, :product_type)
  end
end