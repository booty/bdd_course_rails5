require "rails_helper"

RSpec.describe "Articles", type: :request do

  before do
    @article = Article.create(title: "Title1", body: "Body1")
  end

  describe "GET /articles/:id" do
    context "with existing article" do
      before { get "/articles/#{@article.id}" }

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end

    context "with existing article" do
      before { get "/articles/xxxx" }

      it "handles non-existing article" do
        expect(response.status).to eq 302
      end
    end
  end
end