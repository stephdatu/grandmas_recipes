require 'spec_helper'

feature "Editing directions" do
  let!(:recipe) { FactoryGirl.create(:recipe) }
  let!(:direction) { FactoryGirl.create(:direction, recipe: recipe) }

  before do
    visit '/'
    click_link recipe.title
    click_link direction.description
    click_link "Edit Direction"
  end

  scenario "Updating a direction" do
    fill_in "Description", with: "Preheat oven to 350 degrees"
    click_button "Update Direction"

    expect(page).to have_content "Direction has been updated."

    within("#direction") do
      expect(page).to have_content("Preheat oven to 350 degrees")
    end

    expect(page).to_not have_content direction.description
  end

  scenario "Updating a direction with invalid information" do
    fill_in "Description", with: ""
    click_button "Update Direction"

    expect(page).to have_content("Direction has not been updated.")
  end
end
