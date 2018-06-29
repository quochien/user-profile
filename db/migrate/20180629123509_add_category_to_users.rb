class AddCategoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expert_category_id, :integer
  end
end
