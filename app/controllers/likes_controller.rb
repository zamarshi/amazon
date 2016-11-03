class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    review = Review.find params[:review_id]
    like = Like.new(user: current_user, review: review)


    if like.save
      redirect_to :back, notice: "🐶 Thanks for liking 🐶"
    else
      redirect_to :back, alert: "🌵"
    end
  end

  def destroy
    like = Like.find params[:id]
    if like.destroy
      redirect_to :back, notice: "deleted"
    else
      redirect_to :back
    end

  end


end
