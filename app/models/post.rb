class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 100 }
  belongs_to :user
  # If I delete post it will delete all the comments on it
  has_many :comments, dependent: :destroy
  has_noticed_notifications model: "Notification"
  has_many :notifications, through: :user, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[title body user_email user_name created_at updated_at user_id views]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[comments notifications user]
  end
end