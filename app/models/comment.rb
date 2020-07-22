class Comment < ApplicationRecord
  belongs_to :deal
  validates :name, presence: true, length: { maximum: 20,
                                             too_long: '20 characters in comment is the maximum allowed.' }
  validates :body, presence: true, length: { maximum: 200,
                                             too_long: '200 characters in comment is the maximum allowed.' }
end
