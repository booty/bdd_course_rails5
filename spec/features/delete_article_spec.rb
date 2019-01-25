require "rails_helper"

RSpec.feature "Deleting an article" do
  before do
    @article1 = Article.create(
      title: "First article",
      body: "body body body 1"
      )
    @article2 = Article.create(
      title: "Second article",
      body: "body body body 2"
      )
  end

  scenario "A user deleted an article" do
    visit "/"
    click_link @article1.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been nuked")
    expect(current_path).to eq(articles_path)
  end

end