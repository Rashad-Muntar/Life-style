class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    validates :image, presence: true
    has_one_attached :image

    belongs_to :author, foreign_key: :user_id, class_name: "User"
    belongs_to :category, foreign_key: :category_id, class_name: "Category"
    has_many :votes, dependent: :destroy

end
