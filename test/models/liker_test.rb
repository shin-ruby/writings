require 'test_helper'

class LikerTest < ActiveSupport::TestCase
  
  def setup
  	@liker = Liker.new(writing_id: 302, user_id: 1)
  end

  test "should be valid" do
  	assert @liker.valid?
  end

  test "should require a follower_id" do
  	@liker.user_id = nil
  	assert_not @liker.valid?
  end
end
