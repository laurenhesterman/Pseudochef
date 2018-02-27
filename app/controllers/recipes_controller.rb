class RecipesController < ApplicationController
    
    def show
        @recipe =  Recipe.joins(:user).group("recipes.id").find(params[:id])
        @upvotes = Upvote.where("recipe_id = ?", params[:id]).count
        @downvotes = Downvote.where("recipe_id = ?", params[:id]).count
    end

    def create
        
            @thisrecipe = current_user.recipes.new(recipe_params)
        
        if @thisrecipe.save
            
            redirect_to "/"
        else
            flash[:errors] = @thisrecipe.errors.full_messages
            redirect_to "/recipe/new"
        end
    end

    def search
        @recipesall = Recipe.where("category = ? and level = ? and time = ?", params[:category], params[:level], params[:time])
        # @search = @recipesall.search do
        #     fulltext params[:search]
        # end
        # if (@search)
        #     @recipesall += @search.results
        # end
    end
    def upvote
        
        Upvote.create(user_id: current_user.id, recipe_id: params[:id])
        redirect_to "/recipe/#{params[:id]}"
    end
    def downvote
        
        Downvote.create(user_id: current_user.id, recipe_id: params[:id])
        redirect_to "/recipe/#{params[:id]}"
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to ('/')
    end

    def recipe
    end
    
    def nutrition
    end

    def find
        @recipesall = Recipe.where("category = ? and level = ? and time = ?", params[:category], params[:level], params[:time])
        
            
       
       
        puts @recipesall
        print ("testtestes")
    end

    private
    def recipe_params
        params.permit(:title, :description, :link, :category, :level, :time, :ingredients, :modifications, :text)
    end
    
end
