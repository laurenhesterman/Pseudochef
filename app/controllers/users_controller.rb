class UsersController < ApplicationController
    def index
        @search = Recipe.search do
            fulltext params[:search]
        end
        @recipes = @search.results
        
    end
    def new 
    end
    def create
        @thisuser = User.new(user_params)
        if @thisuser.save
            session[:user_id] = @thisuser.id
            redirect_to ('/')
        else
            flash[:errors] = @thisuser.errors.full_messages
            redirect_to ('/new')
        end
    end
    def user
        @user = User.find(params[:id])
        # @lists = Upvote.joins(:recipe).where("user_id = ?", 1)
       
        @recipes = Recipe.where("user_id = ?", params[:id])
    end
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
