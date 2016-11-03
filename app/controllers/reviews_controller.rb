class ReviewsController < ApplicationController


def create
  @product = Product.find params[:product_id]
    review_params = params.require(:review).permit(:body, :star_count, :user_id)
    @review = Review.new review_params
    @review.product = @product
    @user = current_user
    @review.user = current_user
    if @review.save
    redirect_to product_path(@product), notice: 'Review created'
  else
    render 'products/show'
  end
end

  def destroy
    product = Product.find params[:product_id]
    review = Review.find params[:id]
    review.destroy
    redirect_to product_path(product), notice: 'Review deleted'
  end



end
