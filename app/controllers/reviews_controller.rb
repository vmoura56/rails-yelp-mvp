class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      flash[:success] = "Review successfully created"
      redirect_to @restaurant
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
