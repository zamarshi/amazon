class ReviewsController < ApplicationController




def create
  @product = Product.find params[:product_id]
    review_params = params.require(:review).permit(:body, :star_count, :user_id)
    @review = Review.new review_params
    @review.product = @product
    @user = current_user
    @review.user = current_user
    respond_to do |format|
      if @review.save
      format.html{  redirect_to product_path(@product), notice: 'Review created'}
      format.js{ render :create_success }
    else
      format.html{  render 'products/show'}
      format.js{ render :create_failure }
    end
  end
end

  def destroy
    @review = Review.find params[:id]
    product = @review.product
    respond_to do |format|
      @review.destroy
      format.html{  redirect_to product_path(product), notice: 'Review deleted'}
      format.js {render}
    end


  end
end
