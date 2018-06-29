class RegistrationsController < Devise::RegistrationsController
  protected

  def user_root_path
    profile_users_path
  end
end
