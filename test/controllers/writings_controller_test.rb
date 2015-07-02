require 'test_helper'

class WritingsControllerTest < ActionController::TestCase

  def setup
  	@writing = FactoryGirl.create(:writing)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Writing.count' do
  		post :create, writing: { title: "The Rails", content: "Hello Word", photo: "rails.png" }
  	end
  	assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Writing.count' do
  		delete :destroy, id: @writing
  	end
  	assert_redirected_to new_user_session_path
  end

end
