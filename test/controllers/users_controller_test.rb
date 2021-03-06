require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get feed" do
    get :feed
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get explore" do
    get :explore
    assert_response :success
  end

end
