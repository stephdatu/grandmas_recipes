require 'spec_helper'

feature "Editing Recipes" do
  before do
    FactoryGirl.create(:recipe, title: "Beer Bread")

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
