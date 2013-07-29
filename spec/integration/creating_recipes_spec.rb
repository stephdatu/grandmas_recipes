require 'spec_helper'

feature 'Creating Recipes' do
  scenario "can create a recipe" do
    visit '/'

    click_link 'New Recipe'

    fill_in 'Title', with: 'Beer Bread'
    fill_in 'Ingredients', with: 'Flour, baking powder, sugar, salt, beer'
    click_button 'Create Recipe'

    expect(page).to have_content('Recipe has been created.')
  end
end
