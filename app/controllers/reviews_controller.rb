class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.new review_params
    @review.reviewable = current_user
    @review.user = current_user if current_user
    @review.host_id = params[:host_id]

    @review.save!
    redirect_to @reviewable, notice: "Your comment was posted"
  end

  private

  def review_params
      params.require(:review).permit(:content)
  end

end
