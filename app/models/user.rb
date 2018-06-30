class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  mount_uploader :expert_profile_picture, ExpertProfilePictureUploader

  has_one :expert_category

  def rate(rating)
    count = expert_review_count + 1
    rating = (expert_rating * expert_review_count + rating) / count
    update_attributes(expert_review_count: count, expert_rating: rating)
  end
end
