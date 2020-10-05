class Favorite < ApplicationRecord
  validates :user_id, {presence: true}
  validates :book_id, {presence: true}
  belongs_to :book
  belongs_to :user
  validates_uniqueness_of :book_id, scope: :user_id
end
