require 'test_helper'

class WritingTest < ActiveSupport::TestCase
  
  def setup
  	@user = FactoryGirl.create(:user)
  	@writing = @user.writings.build(title: "Writing Title", content: "Text some content", photo: "img_url")
  end

  test "should be valid" do
  	assert @writing.valid?
  end

  test "user id should be present" do
  	@writing.user_id	= nil
  	assert_not @writing.valid?
  end

  test "title should be present" do
  	@writing.title = " "
  	assert_not @writing.valid?
  end

  test "title should be at most 200 characters" do
  	@writing.title = 'a' * 201
  	assert_not @writing.valid?
  end

  test "order should be most recent first" do
  	assert_equal Writing.first, writings(:two)
  end

end
