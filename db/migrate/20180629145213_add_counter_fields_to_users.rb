class AddCounterFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expert_review_count, :integer, default: 0
    add_column :users, :expert_reading_count, :integer, default: 0
    add_column :users, :expert_rating, :float, default: 0.0
  end
end
