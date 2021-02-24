class ReviewsController < ApplicationController
    def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list

    if @review.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
