require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
		@user = FactoryGirl.create(:user)
		@tom = FactoryGirl.create(:user, username: "Tom", email: 'tom@gmail.com', password: "password", password_confirmation: "password")
	end

	test "should redirect following when not logged in" do
		get :following, id: @user
		assert_redirected_to new_user_session_url
	end

	test "should redirect followers when not logged in" do
		get :followers, id: @user
		assert_redirected_to new_user_session_url
	end

end