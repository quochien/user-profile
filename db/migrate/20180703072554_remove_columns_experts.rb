class RemoveColumnsExperts < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :expert_specialities, :string
    remove_column :users, :expert_skills_and_methods, :string
    remove_column :users, :expert_languages, :string
  end
end
