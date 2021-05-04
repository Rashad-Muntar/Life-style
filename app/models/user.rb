class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :password, presence:true
    has_secure_password

    has_many :articles
    has_many :votes
    has_many :comments
    before_save { name.downcase! }
end
