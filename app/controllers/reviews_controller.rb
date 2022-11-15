class ReviewsController < ApplicationController

  def new
    # TODO
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    # render 'reviews/new.html.erb'
  end

  def create
    # TODO
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    # @review.save # => true/false
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(@restaurant), status: :see_other, notice: "Review successfully deleted"
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
