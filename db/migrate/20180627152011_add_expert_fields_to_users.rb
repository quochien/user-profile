class AddExpertFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expert_name, :string
    add_column :users, :expert_service, :string
    add_column :users, :expert_introduction, :string
    add_column :users, :expert_specialities, :string
    add_column :users, :expert_skills_and_methods, :string
    add_column :users, :expert_languages, :string
    add_column :users, :expert_rate_per_minute, :decimal
    add_column :users, :expert_profile_picture, :string
    add_column :users, :expert_call_enabled, :boolean
    add_column :users, :expert_chat_enabled, :boolean
  end
end
