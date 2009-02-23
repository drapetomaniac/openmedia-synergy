require 'test_helper'

class ChannelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create channels" do
    assert_difference('Channels.count') do
      post :create, :channels => { }
    end

    assert_redirected_to channels_path(assigns(:channels))
  end

  test "should show channels" do
    get :show, :id => channels(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => channels(:one).id
    assert_response :success
  end

  test "should update channels" do
    put :update, :id => channels(:one).id, :channels => { }
    assert_redirected_to channels_path(assigns(:channels))
  end

  test "should destroy channels" do
    assert_difference('Channels.count', -1) do
      delete :destroy, :id => channels(:one).id
    end

    assert_redirected_to channels_path
  end
end
