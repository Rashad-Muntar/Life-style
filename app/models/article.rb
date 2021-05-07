class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
  has_one_attached :image

  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :category, foreign_key: :category_id, class_name: 'Category'
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :most_popular_articles, lambda {
                                  where(id: all_published_articles.joins(:votes).group(:id).count.sort_by do |_k, v|
                                              v
                                            end.last(4).map { |a, _b| a })
                                }
end
