require "rails_helper"

# create 2 articles to display
# list 2 articles
# make sure titles present in content

RSpec.feature "Listing Articles" do
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

  scenario "A user lists all articles" do
    visit "/"

    [@article1.title, @article2.title, @article1.body, @article2.body].each do |c|
      expect(page).to have_content(c)
    end

    [@article1.title, @article2.title].each do |t|
      expect(page).to have_link(t)
    end
  end

  scenario "A user has no articles" do
    Article.delete_all
    visit "/"
    within ("h1#no-articles") do
      expect(page).to have_content("No Articles Created")
    end
  end

end
