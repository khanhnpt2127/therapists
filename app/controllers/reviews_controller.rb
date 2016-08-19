class ReviewsController < ApplicationController
  before_action :find_reviewable
  def new
    @review = Review.new
  end

  def create
    @review = @reviewable.reviews.new review_params
    if @review.save!
      redirect_to :back, notice: "Your comment was posted"
    end
  end

  def destroy 
    user = current_user || current_host
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to user_path(user)
    else
      redirect_to user_path(user), notice: "Cannot delete Comments"
    end
  end
  
  private

  def review_params
      params.require(:review).permit(:content, :user_id, :user_type)
  end
  
  def find_reviewable
    @reviewable = Review.find(params[:review_id]) if params[:review_id] 
    @reviewable = User.find(params[:user_id]) if params[:user_id]
    @reviewable = Host.find(params[:host_id]) if params[:host_id]

  
  end
end
