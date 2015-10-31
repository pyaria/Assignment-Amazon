class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    render :show
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    products = Product.all
    @products = products.order(:id)
    @num_products = @products.length
    render :index
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    # render text: "destroyed!"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit([:name, :price, :code, :description])
  end
end
