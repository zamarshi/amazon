class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :review_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
end
