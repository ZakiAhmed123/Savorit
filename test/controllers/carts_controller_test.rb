require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
