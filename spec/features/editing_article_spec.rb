require "rails_helper"

# create 2 articles to display
# list 2 articles
# make sure titles present in content

RSpec.feature "Listing Articles" do
  before do
    @article = Article.create(
      title: "First article",
      body: "body body body 1"
      )
  end

  scenario "A user updates an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: "Updated Title"
    fill_in "Body", with: "Updated Body"
    click_button "Update Article"

    expect(page).to have_content "Article has been updated"
    expect(page).to have_content "Updated Title"
    expect(page.current_path).to eq article_path(@article)
  end

  scenario "A user fucks up an article and it don't save good" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: ""
    fill_in "Body", with: "Updated Body"
    click_button "Update Article"

    expect(page).to have_content "Article has not been updated"
  end
end
