class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  mount_uploader :expert_profile_picture, ExpertProfilePictureUploader

  has_one :expert_category
  has_many :reviews, foreign_key: :expert_id
  has_many :specialities
  has_many :skills
  has_many :languages
  accepts_nested_attributes_for :specialities, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :languages, allow_destroy: true

  def rate(rating)
    count = expert_review_count + 1
    rating = (expert_rating * expert_review_count + rating) / count
    update_attributes(expert_review_count: count, expert_rating: rating)
  end
end
