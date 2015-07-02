class RemoveUsernameFromUserInfos < ActiveRecord::Migration
  def change
    remove_column :user_infos, :username, :string
  end
end
