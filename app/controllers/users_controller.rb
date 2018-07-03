class UsersController < ApplicationController
  before_action :authenticate_user!

  def experts
    current_user.specialities = [Speciality.new] unless current_user.specialities.exists?
    current_user.skills = [Skill.new] unless current_user.skills.exists?
    current_user.languages = [Language.new] unless current_user.languages.exists?
  end

  def update_experts
    current_user.assign_attributes(expert_params)
    current_user.save
    current_user.specialities.where(name: [nil, '']).destroy_all
    current_user.skills.where(name: [nil, '']).destroy_all
    current_user.languages.where(name: [nil, '']).destroy_all

    flash[:success] = "Expert updated successfully!"
    redirect_to experts_users_path
  end

  def profile
  end

  def rating
    if expert = User.find_by_id(params[:id])
      # expert.rate(params[:rating].to_i)
      if current_user
        review = Review.new(review_params)
        review.user_id = current_user.id
        review.expert_id = expert.id
        review.save

        expert.rate(review.rating)

        flash[:success] = "You have rated #{review.rating.to_i} for #{expert.expert_name}"
      end

      redirect_to expert_path(expert)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comments)
  end

  def expert_params
    params.require(:user).permit(
      :expert_name,
      :expert_service,
      :expert_category_id,
      :expert_introduction,
      :expert_rate_per_minute,
      :expert_profile_picture,
      :expert_call_enabled,
      :expert_chat_enabled,
      specialities_attributes: [:id, :name],
      skills_attributes: [:id, :name],
      languages_attributes: [:id, :name]
    )
  end
end
