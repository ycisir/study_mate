require 'rails_helper'

RSpec.feature "UserAuthentications", type: :feature do
  scenario "User signs up" do
    visit new_user_registration_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "User logs in" do
    User.create(email: "test@example.com", password: "password123")

    visit new_user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "User logs out" do
    User.create(email: "test@example.com", password: "password123")

    visit new_user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    click_button "Log in"

    # Click the button to log out
    click_button "Sign out" # This will click the button in the form

    expect(page).to have_content("Signed out successfully.")
  end
end
