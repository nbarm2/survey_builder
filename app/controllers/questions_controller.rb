class QuestionsController < ApplicationController
  
  def new
    @question = Question.new
    @title = "New Question"
  end
  
  def create
    @question = Question.new(params[:question])
    @survey = session[:survey]
    @question.survey_id = @survey.id
    if @question.save
      flash[:success] = "Question created."
      redirect_to @survey
    else
      redirect_to @survey
    end
  end
  
  def edit
    @title = "Edit Question"
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @survey = session[:survey]
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated."
      redirect_to @survey
    else
      @title = "Edit Question"
      render 'edit'
    end
  end
  
  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted."
    redirect_to session[:survey]
  end

end
