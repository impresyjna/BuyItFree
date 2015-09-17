require 'test_helper'

class GoodsControllerTest < ActionController::TestCase
  test "should get mine" do
    get :mine
    assert_response :success
  end

end
