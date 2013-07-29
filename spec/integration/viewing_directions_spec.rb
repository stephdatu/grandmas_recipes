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

  scenario "Viewing tickets for a given project" do
    click_link "Beer Bread"
    expect(page).to have_content("1")
    expect(page).to_not have_content("2")
    click_link "1"
    within("#direction h2") do
      expect(page).to have_content("1")
    end
    expect(page).to have_content("Preheat oven")
  end
end
