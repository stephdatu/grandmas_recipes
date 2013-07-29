require 'spec_helper'

feature 'Creating Recipes' do
  before do
    visit '/'

    click_link 'New Recipe'
  end

  scenario "can create a recipe" do
    fill_in 'Title', with: 'Beer Bread'
    fill_in 'Ingredients', with: 'Flour, baking powder, sugar, salt, beer'
    click_button 'Create Recipe'

    expect(page).to have_content('Recipe has been created.')
  end

  scenario "can not create a recipe without a title" do
    click_button 'Create Recipe'

    expect(page).to have_content("Recipe has not been created.")
    expect(page).to have_content("Title can't be blank")
  end
end
