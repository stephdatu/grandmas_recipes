require 'spec_helper'

feature "Deleting recipes" do
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
  end

  scenario "Deleting a recipe" do
    click_link "Delete Recipe"

    visit '/'
    expect(page).to have_no_content("Beer Bread")
  end
end
