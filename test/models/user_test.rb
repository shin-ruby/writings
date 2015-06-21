require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    #@request.env["devise.mapping"] = Devise.mappings[:user]
    #sign_in FactoryGirl.create(:user)
    @user = FactoryGirl.create(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

end
