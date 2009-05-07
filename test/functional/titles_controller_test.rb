require 'test_helper'

class TitlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create titles" do
    assert_difference('Titles.count') do
      post :create, :titles => { }
    end

    assert_redirected_to titles_path(assigns(:titles))
  end

  test "should show titles" do
    get :show, :id => titles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => titles(:one).id
    assert_response :success
  end

  test "should update titles" do
    put :update, :id => titles(:one).id, :titles => { }
    assert_redirected_to titles_path(assigns(:titles))
  end

  test "should destroy titles" do
    assert_difference('Titles.count', -1) do
      delete :destroy, :id => titles(:one).id
    end

    assert_redirected_to titles_path
  end
end
