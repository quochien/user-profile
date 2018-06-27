class UsersController < ApplicationController
  before_action :authenticate_user!

  def experts
  end

  def update_experts
    current_user.update_attributes(expert_params)
    flash[:success] = "Expert updated successfully!"
    redirect_to experts_users_path
  end

  private

  def expert_params
    params.require(:user).permit(
      :expert_name,
      :expert_service,
      :expert_introduction,
      :expert_specialities,
      :expert_skills_and_methods,
      :expert_languages,
      :expert_rate_per_minute,
      :expert_profile_picture,
      :expert_call_enabled,
      :expert_chat_enabled
    )
  end
end
