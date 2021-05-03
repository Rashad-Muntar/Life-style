class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    validates :image, presence: true

    belongs_to :author, foreign_key: :user_id, class_name: "User"
    belongs_to :category, class_name: "Article"

end
