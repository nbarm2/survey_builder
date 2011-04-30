class SurveysController < ApplicationController
  before_filter :check_user, :only => []
  
  def index
    @title = "All Surveys"
    @surveys = Survey.all.paginate(:page => params[:page], :per_page => 6)
    @counter = 0
  end
  
  def new
    @survey = Survey.new
    @title = "New Survey"
  end
  
  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:success] = "Survey created."
      redirect_to surveys_path
    else
      redirect_to surveys_path
    end
  end
  
  def show
    @survey = Survey.find(params[:id])
    session[:survey] = @survey
    #@microposts = @user.microposts.all.paginate(:page => params[:page], :per_page => 10)
    @questions = @survey.questions.all
    @title = @survey.name
    @counter = 0
  end
  
  def destroy
    Survey.find(params[:id]).destroy
    flash[:success] = "Survey destroyed."
    redirect_to surveys_path
  end
  
  def take
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.all
    @title = @survey.name
    @counter = 0
  end
  
  def results
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.all
    @new_results = {}
    @title = @survey.name + " Results"
    @counter = 0
    for q in @questions
      if params["score" + q.id.to_s] == nil #no answer
        flash[:error] = "Missing Answers"
        redirect_to "/surveys/take/" + params[:id]
        return
      end
    end
    for q in @questions
      @score = params["score" + q.id.to_s][:score_v]
      @result = Result.create(:score => @score, :question_id => q.id.to_s)
      @new_results[q.id.to_s] = @score
    end
  end
  
  def total
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.all
    @title = @survey.name + " Results"
    @counter = 0
  end
  
  private
    
    def check_user
      #redirect_to(root_path) unless session[:type] == '0'
    end

end
