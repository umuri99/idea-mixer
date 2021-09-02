class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 42}
  validates :theme1, presence: true, length: { maximum: 22}
  validates :theme2, presence: true, length: { maximum: 22}
  validates :content, presence: true
end
