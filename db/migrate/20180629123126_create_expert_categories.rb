class CreateExpertCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :expert_categories do |t|
      t.string :name
    end
  end
end
