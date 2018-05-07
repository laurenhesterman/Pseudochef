require 'rails_helper'
feature "guest user views a user profile" do
    scenario "there is no current user logged in" do  
        visit("/recipe/#{id}")
        #test is throwing error because of 'id'
        # error: `id` is not available from within an example (e.g. an `it` block)
        #either need path name that doesn't specify id (can't create?) or connection to dest db is errored
        click_link "#{@recipe.user.username}"
        expect(page).to have_content "Description"
    end
    scenario "current user is logged in" do  
        # visit recipe_new_path
        visit("/recipe/#{id}")
        click_link "#{@recipe.user.username}"
        expect(page).to have_content "Description"
    end
end

# visit('users/create')
# click_button('Home')
# expect(page).to have_content "Description"



# expect(page).to have_current_path(user_path(User.last))