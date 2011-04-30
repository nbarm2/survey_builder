class PagesController < ApplicationController
  def home
    @title = "Home"
    unless params[:users1] == nil
      @id = params[:users1][:id]
      @user = User.find(@id)
      @type = @user.type_id
      session[:type] = @type.to_s
      session[:name] = @user.name
      redirect_to(surveys_path)
    end
  end

  def about
    @title = "about"
  end
  
  def help
    @title = "Help"
  end

end
