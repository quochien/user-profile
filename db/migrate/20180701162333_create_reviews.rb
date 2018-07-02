class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :expert_id
      t.float   :rating
      t.text    :comments

      t.timestamps
    end
  end
end
