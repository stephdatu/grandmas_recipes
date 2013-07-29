require 'spec_helper'

feature "Deleting recipes" do
  scenario "Deleting a recipe" do
    FactoryGirl.create(:recipe, title: "Beer Bread")

    visit '/'
    click_link "Beer Bread"
    click_link "Delete Recipe"

    visit '/'
    expect(page).to have_no_content("Beer Bread")
  end
end
