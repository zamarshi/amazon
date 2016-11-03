class Review < ApplicationRecord

  belongs_to :product
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :body, presence: true, length: {minimum: 5, message: 'must be longer than 5 characters'}
  validates :star_count, numericality: {less_than: 6, message: 'must be less than 6 stars'}
  validates :star_count, numericality: {greater_than: 0, message: 'must be more than 0 stars'}

end
