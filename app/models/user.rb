class User < ApplicationRecord

  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX



  has_many :products, dependent: :nullify
  has_many :reviews, dependent: :nullify
  has_many :favourites, dependent: :destroy
  has_many :favourite_products, through: :favourites, source: :product
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review

  def full_name
    first = first_name.capitalize
    last = last_name.capitalize
    "#{first} #{last}"
  end

private

  def downcase_email
      self.email.downcase! if email.present?
    end



end
