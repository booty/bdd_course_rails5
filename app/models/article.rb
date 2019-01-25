class Article < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  def self.newest_first
    order(id: :desc)
  end
end
