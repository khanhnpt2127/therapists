class ReviewsController < ApplicationController

  def create
    if current_user
      @review = current_user.reviews.new review_params
      @review.reviewable = current_user
      @review.user = current_user if current_user
    else
      @review = current_host.reviews.new review_params
      @review.reviewable = current_host
      @review.host_id = current_host if current_host

    end
      @review.user_id = params[:user_id]
      @review.host_id = params[:host_id]

    @review.save!
    redirect_to @reviewable, notice: "Your comment was posted"
  end

  private

  def review_params
      params.require(:review).permit(:content)
  end

end
