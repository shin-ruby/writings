require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = FactoryGirl.create(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "associated user_info should be destroy" do
    @user.create_user_info(bio: "Hello Word")
    assert_difference 'UserInfo.count', -1 do
      @user.destroy
    end
  end

  test "associated writing should be destroy" do
    @user.writings.create!(title: "Writing Title", content: "Text some content", photo: "img_url")
    assert_difference 'Writing.count', -1 do
      @user.destroy
    end
  end

end
