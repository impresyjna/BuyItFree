require 'test_helper'

class SendWaysControllerTest < ActionController::TestCase
  setup do
    @send_way = send_ways(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:send_ways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create send_way" do
    assert_difference('SendWay.count') do
      post :create, send_way: { good_id: @send_way.good_id, how_many_days: @send_way.how_many_days, name: @send_way.name, price: @send_way.price }
    end

    assert_redirected_to send_way_path(assigns(:send_way))
  end

  test "should show send_way" do
    get :show, id: @send_way
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @send_way
    assert_response :success
  end

  test "should update send_way" do
    patch :update, id: @send_way, send_way: { good_id: @send_way.good_id, how_many_days: @send_way.how_many_days, name: @send_way.name, price: @send_way.price }
    assert_redirected_to send_way_path(assigns(:send_way))
  end

  test "should destroy send_way" do
    assert_difference('SendWay.count', -1) do
      delete :destroy, id: @send_way
    end

    assert_redirected_to send_ways_path
  end
end
