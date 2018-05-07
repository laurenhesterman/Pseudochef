require 'rails_helper'
feature "check main page" do
    scenario "successfully creates a new user account" do
        visit "/new"
        fill_in "username", with: "Lauren"
        # fill_in "email", with: "lauren@test.com"       
        click_button "Register"
        expect(page).to have_content "Welcome, Lauren"   
    end
    #The above test won't pass because a user is required to fill in email. However the login "email" id/value is also on the same page causing an error.
    #either removing email requirement or changing the id/value is required to get this test to pass
    scenario "unsuccessfully creates a new user account" do 
        visit "/new"
        click_button "Register"
        expect(current_path).to eq("/new")
    end
end

#to run tests, run rspec spec/features/create_user_spec.rb