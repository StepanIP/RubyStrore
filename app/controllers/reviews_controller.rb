class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @product.reviews.exists?(user: current_user)
      flash[:alert] = "You have already reviewed this product."
      redirect_to @product
    elsif @review.save
      flash[:notice] = "Review successfully created."
      redirect_to @product
    else
      flash[:alert] = "There was an error creating your review."
      render 'products/show'
    end
  end

  private def review_params
    params.require(:review).permit(:content, :rating)
  end
end