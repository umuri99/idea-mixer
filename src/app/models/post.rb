class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :theme1, presence: true
  validates :theme2, presence: true
  validates :content, presence: true
end
