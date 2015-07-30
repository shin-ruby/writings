class CreateLikers < ActiveRecord::Migration
  def change
    create_table :likers do |t|
      t.integer :user_id
      t.integer :writing_id

      t.timestamps null: false
    end
    add_index :likers, :user_id
    add_index :likers, :writing_id
    add_index :likers, [:user_id, :writing_id], unique: true
  end
end
