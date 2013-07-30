require 'spec_helper'

feature 'Creating Recipes' do
  before do
    Factory(:recipe, title: "Beer Bread")
    user = Factory(:user, email: "grandma@recipes.com")

    visit '/'
    click_link 'New Recipe'
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", with: "grandma@recipes.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("New Recipe")
  end

  scenario "can create a recipe" do
    fill_in 'Title', with: 'Beer Bread'
    fill_in 'Ingredients', with: 'Flour, baking powder, sugar, salt, beer'
    click_button 'Create Recipe'

    expect(page).to have_content('Recipe has been created.')
    within("#author") do
      page.should have_content("Created by grandma@recipes.com")
    end
  end

  scenario "can not create a recipe without a title" do
    click_button 'Create Recipe'

    expect(page).to have_content("Recipe has not been created.")
    expect(page).to have_content("Title can't be blank")
  end
end
