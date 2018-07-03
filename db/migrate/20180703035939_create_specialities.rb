class CreateSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :specialities do |t|
      t.integer :user_id
      t.string :name
    end
  end
end
