require "rails_helper"

RSpec.feature "Showing an article" do
  before do
    @article1 = Article.create(
      title: "First article",
      body: "body body body 1"
      )
    # @article2 = Article.create(
    #   title: "Second article",
    #   body: "body body body 2"
    #   )
  end

  scenario "A user reads some shit" do
    visit "/"
    click_link @article1.title

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(current_path).to eq(article_path(@article1))
  end
end
