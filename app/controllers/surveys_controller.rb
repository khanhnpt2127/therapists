class SurveysController < ApplicationController
  
  def index
    @surveys = Survey.all
  end
  
  def new
    @survey = Survey.new
    3.times { @survey.questions.build }
  end
  
  
  def create
    @survey = Survey.new survey_params
    if @survey.save
      redirect_to hosts_user_path(current_user.id)
  else
    raise "WTF"
  end
end

  private

  def survey_params
    params.require(:survey).permit(:name, :user_id)
  end
end
