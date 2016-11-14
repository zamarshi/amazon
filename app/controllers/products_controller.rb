class ProductsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
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
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @product }
      format.json { render json: @product.to_json(include: :reviews) }
    end
  end

  def index
    @products = Product.order(created_at: :desc)
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @products }
      format.json { render json: @products.to_json }
    end
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
