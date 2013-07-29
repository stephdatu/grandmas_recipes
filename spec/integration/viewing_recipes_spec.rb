require 'spec_helper'

feature "Viewing recipes" do
  scenario "Listing all recipes" do
    recipe = FactoryGirl.create(:recipe, title: "Beer Bread")
    visit '/'
    click_link 'Beer Bread'
    expect(page.current_url).to eql(recipe_url(recipe))
  end
end
