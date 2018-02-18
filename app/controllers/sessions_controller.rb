class SessionsController < ApplicationController
    
    def create
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/"
      else 
        flash[:errors] = ["Invalid Combination"]
        redirect_to "/new"
      end
    end
  
    def destroy
      reset_session
      redirect_to "/"
    end
end
