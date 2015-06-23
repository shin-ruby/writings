require 'test_helper'

class UserInfoTest < ActiveSupport::TestCase
  
  def setup
  	@user = FactoryGirl.create(:user)
  	@user_info = @user.build_user_info(username: "Shin", bio: "Hello Word")
  end

  test "should be valid" do
  	assert @user_info.valid?
  end

  test "user id should be present" do
  	@user_info.user_id = nil
  	assert_not @user_info.valid?
  end

  test "username should be present" do
    @user_info.username = " "
    assert_not @user_info.valid?
  end

end
