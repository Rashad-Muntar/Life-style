class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  has_many :articles, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments
  before_save { name.downcase! }
end
