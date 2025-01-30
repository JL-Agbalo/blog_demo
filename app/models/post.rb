class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 100 }
  belongs_to :user
  # If i delete post it will delete all the comments on it
  has_many :comments, dependent: :destroy
  has_noticed_notifications model: "Notification"
  has_many :notifications, through: :user, dependent: :destroy
end
