class FavouritesController < ApplicationController

  before_action :authenticate_user
    def create
      product = Product.find params[:product_id]
      favourite = Favourite.new(user: current_user, product: product)

      if favourite.save
        redirect_to :back, notice: "🐶 Thanks for liking 🐶"
      else
        redirect_to :back, alert: "🌵"
      end
    end

    def destroy
      favourite = Favourite.find params[:id]
      if favourite.destroy
        redirect_to :back, notice: "deleted"
      else
        redirect_to :back
      end

    end

  def index
    @favourites = current_user.favourites
  end


end
