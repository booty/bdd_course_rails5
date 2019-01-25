require "rails_helper"

RSpec.feature "Creating articles, motherfucker" do
  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Real motherfuckin bros"
    fill_in "Body", with: "Drink Natty ice! The end."
    click_button "Create Article, Motherfucker"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end
