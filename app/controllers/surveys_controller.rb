class SurveysController < ApplicationController
  before_action :authenticate_user!
  def index
    @surveys = Survey.all
  end
  
  def show
    @survey = Survey.find(params[:id])
  end
  
  def new
    @survey = Survey.new
    questions = [1,2,3]
    questions.each do |q|
      question = @survey.questions.build(content: "Question=#{q}")
      4.times { question.answers.build }
    end
  end
  
  def create
    @survey = Survey.new survey_params
    if @survey.save!
      flash[:notice] = "Successfully created survey."
      redirect_to hosts_user_path(current_user.id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @survey = Survey.find(params[:id])
  end
  
  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to @survey
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to surveys_url
  end

  private
  def survey_params
    params.require(:survey).permit(:name,:user_id, questions_attributes: [ :content,{ answers_attributes: [:content]}])
  end
end
