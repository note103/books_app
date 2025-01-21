class Book < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :memo, presence: true, length: { minimum: 5 }
  mount_uploader :picture, PictureUploader
end
