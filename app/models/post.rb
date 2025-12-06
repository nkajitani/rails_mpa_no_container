# ブログ
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :list, resize_to_fit: [ 120, 120 ]
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :published_at, presence: true
end
