class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    validates :image, presence: true

    belongs_to :authorId, class_name: "User"
end
