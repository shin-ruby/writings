require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase

	test "create should require logged-in user" do
		assert_no_difference 'Relationship.count' do
			post :create
		end
		assert_redirected_to new_user_session_url
	end

end
