require 'spec_helper'

feature "Deleting directions" do
  let!(:recipe) { FactoryGirl.create(:recipe) }
  let!(:direction) { FactoryGirl.create(:direction, recipe: recipe) }

  before do
    visit '/'
    click_link recipe.title
    click_link direction.description
  end

  scenario "Deleting a direction" do
    click_link "Delete Direction"

    expect(page).to have_content("Direction has been deleted.")
    expect(page.current_url).to eq(recipe_url(recipe))
  end
end
