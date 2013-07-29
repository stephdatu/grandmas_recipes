require 'spec_helper'

feature "Creating Directions" do
  before do
    FactoryGirl.create(:recipe, title: "Pancake Muffins")
    visit '/'
    click_link "Pancake Muffins"
    click_link "New Direction"
  end

  scenario "Creating a direction" do
    fill_in "Step number", with: "1"
    fill_in "Description", with: "Preheat oven to 350 degrees"
    click_button "Create Direction"
    expect(page).to have_content("Direction has been created.")
  end

  scenario "Creating a direction without attributes is bad" do
    click_button "Create Direction"
    expect(page).to have_content("Direction has not been created.")
    expect(page).to have_content("Step number can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Creating a direction with step number less than zero is bad" do
    fill_in "Step number", with: "0"
    click_button "Create Direction"
    expect(page).to have_content("Direction has not been created.")
    expect(page).to have_content("Step number must be greater than 0")
  end
end
