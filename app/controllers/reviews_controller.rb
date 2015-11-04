class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(params.require(:review).permit([:title, :rating, :body]))
    @review.product = @product
    if @review.save
      redirect_to product_path(@product), notice: "Review saved!"
    else
      flash[:alert] = @review.errors.full_message.join(", ")
      render "products/show"
    end
  end
end
