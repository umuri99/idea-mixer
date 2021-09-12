class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true #削除してもバリデーションは有効
  validates :post_id, presence: true #削除してもバリデーションは有効
end
