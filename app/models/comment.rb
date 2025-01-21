class Comment < ApplicationRecord
  belongs_to :book

  validates :body, presence: true, length: { minimum: 3 }
end
