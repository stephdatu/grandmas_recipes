require 'spec_helper'

feature "Viewing recipes" do
  before do
    user = Factory(:user)
    recipe = Factory(:recipe, title: "Beer Bread")
    recipe.update_attribute(:user, user)
  end

  scenario "Listing all recipes" do
    visit '/'
    click_link 'Beer Bread'
    #current_url.should eq recipe_url
  end
end
