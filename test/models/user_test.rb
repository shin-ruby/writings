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

  test "should follow and unfollow a user" do
    shin = @user
    tom = FactoryGirl.create(:user, username: "Tom", email: 'tom@gmail.com', password: "password", password_confirmation: "password")
    assert_not shin.following?(tom)
    shin.follow(tom)
    assert shin.following?(tom)
    assert tom.followers.include?(shin)
    shin.unfollow(tom)
    assert_not shin.following?(tom)
  end

end
