# frozen_string_literal: true
require "rails_helper"

# Signing up users
#   visit root
#   click on signup link
#     email
#     password
#     password confirmation
#   click submit
#   look for success message
#
#   invalid signup
#   do invalid signup, be sure it fails


RSpec.feature "Signup users" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario "with invalid credentials" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "yourmom"
    click_button "Sign up"

    expect(page).to have_content("1 error prohibited this user from being saved")
  end

end
