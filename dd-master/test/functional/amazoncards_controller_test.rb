require 'test_helper'

class AmazoncardsControllerTest < ActionController::TestCase
  setup do
    @amazoncard = amazoncards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amazoncards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amazoncard" do
    assert_difference('Amazoncard.count') do
      post :create, amazoncard: { code: @amazoncard.code, used: @amazoncard.used }
    end

    assert_redirected_to amazoncard_path(assigns(:amazoncard))
  end

  test "should show amazoncard" do
    get :show, id: @amazoncard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @amazoncard
    assert_response :success
  end

  test "should update amazoncard" do
    put :update, id: @amazoncard, amazoncard: { code: @amazoncard.code, used: @amazoncard.used }
    assert_redirected_to amazoncard_path(assigns(:amazoncard))
  end

  test "should destroy amazoncard" do
    assert_difference('Amazoncard.count', -1) do
      delete :destroy, id: @amazoncard
    end

    assert_redirected_to amazoncards_path
  end
end
