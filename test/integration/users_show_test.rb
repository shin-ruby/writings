require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
  	@user = FactoryGirl.create(:user)
  end

  test "user show display" do
  	get user_path(@user)
  	assert_template 'users/show'
  	assert_select 'title', full_title(@user.username)
  	
  end
end
