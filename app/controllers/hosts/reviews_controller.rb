class Hosts::ReviewsController < ReviewsController
 before_action :set_reviewable
  
    private
  
  def set_reviewable
    @reviewable = Host.find(params[:host_id])
      
  end
  
end
