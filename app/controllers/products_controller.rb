class ProductsController < ApplicationController

before_action :authenticate_user
  def new
    @product = Product.new
    @category = Category.new
  end

  def create
    product_params = params.require(:product).permit([:title, :description, :price, :sale_price, :category_id, :user_id, tag_ids: []])
    @product = Product.new product_params
    @user = current_user
    @product.user = current_user
     if @product.save
       redirect_to product_path(@product)
     else
       render :new
     end
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

  def index
    @products = Product.order(created_at: :desc)
  end

  def edit
    @product = Product.find params[:id]
  end

  def update

    @product = Product.find params[:id]
    product_params = params.require(:product).permit(:title, :description, :price)
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
  #
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end

end
