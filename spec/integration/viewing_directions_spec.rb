require 'spec_helper'

feature "Viewing directions" do
  before do
    beer_bread = FactoryGirl.create(:recipe, title: "Beer Bread")
    FactoryGirl.create(:direction, recipe: beer_bread,
    step_number: "1",
    description: "Preheat oven")

    pancake_muffins = FactoryGirl.create(:recipe, title: "Pancake Muffins")
    FactoryGirl.create(:direction, recipe: pancake_muffins,
    step_number: "2",
    description: "Fill in muffin tin")

    visit '/'
  end

  scenario "Viewing directions for a given project" do
    click_link "Beer Bread"
    expect(page).to have_content("Preheat oven")
    expect(page).to_not have_content("Fill in muffin tin")
    click_link "Preheat oven"
    within("#direction") do
      expect(page).to have_content("Preheat oven")
    end
  end
end
