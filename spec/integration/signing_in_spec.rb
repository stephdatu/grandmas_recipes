require 'spec_helper'

feature "Signing In" do
  before do
    Factory(:user, :email => "grandma@recipes.com")
  end

  scenario "Signing in via form" do
   User.find_by_email("grandma@recipes.com")
    visit '/'
    click_link 'Sign in'
    fill_in "Email", with: "grandma@recipes.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
