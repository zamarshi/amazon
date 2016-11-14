class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    @review = Review.find params[:review_id]
    like = Like.new(user: current_user, review: @review)

    respond_to do |format|
      if like.save
        format.html{  redirect_to :back, notice: "🐶 Thanks for liking 🐶"}
        format.js { render :create_success }
      else
        format.html{redirect_to :back, alert: "🌵"}
        format.js { render :create_failure }
      end
    end
  end

  def destroy
    like = Like.find params[:id]
    @review = like.review
    respond_to do |format|
      if like.destroy
        format.html {redirect_to review, notice: 'Answer deleted!'}
        format.js { render :destroy }
      else
        format.html{redirect_to :back}
        format.js{render :destroy_failure}
      end

    end
  end

end
