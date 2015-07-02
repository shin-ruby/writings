class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.string :title
      t.text :content
      t.string :photo
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :writings, [:user_id, :created_at]
  end
end
