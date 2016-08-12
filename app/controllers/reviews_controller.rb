class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.new review_params 
    @review.reviewable = current_user

    if current_user
      @review.user_id = current_user.id
    else
      @review.host_id = current_host.id
    end

    @review.save
    redirect_to @reviewable, notice: "Your comment was posted"
  end

  private

  def review_params
      params.require(:review).permit(:content)
  end

end
