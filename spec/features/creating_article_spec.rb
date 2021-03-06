# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Creating articles, motherfucker" do
  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Real motherfuckin bros"
    fill_in "Body", with: "Drink Natty ice! The end."
    click_button "Save Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "A user fails to create a new article" do
    visit "/"
    click_link "New Article"
    click_button "Save Article"
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
