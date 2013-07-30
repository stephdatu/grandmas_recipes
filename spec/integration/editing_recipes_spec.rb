require 'spec_helper'

feature "Editing Recipes" do
  let!(:user) { Factory(:user) }
  let!(:recipe) do
  recipe = Factory(:recipe, title: "Beer Bread")
    recipe.update_attribute(:user, user)
    recipe
  end

  before do
    sign_in_as!(user)

    visit '/'
    click_link "Beer Bread"
    click_link "Edit Recipe"
  end

  scenario "Updating a recipe" do
    fill_in "Title", with: "Cheddar Beer Bread"
    click_button "Update Recipe"

    expect(page).to have_content("Recipe has been updated.")
  end

  scenario "Updating a recipe with invalid attributes is bad" do
    fill_in "Title", with: ""
    click_button "Update Recipe"
    expect(page).to have_content("Recipe has not been updated.")
  end
end
