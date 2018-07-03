class RegistrationsController < Devise::RegistrationsController
  protected

  def user_root_path
    profile_users_path
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
