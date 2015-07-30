class AddCommentsCountToWritings < ActiveRecord::Migration
  def change
    add_column :writings, :comments_count, :integer
  end
end
