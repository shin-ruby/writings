class AddViewCountToWritings < ActiveRecord::Migration
  def change
    add_column :writings, :view_count, :integer
  end
end
