require 'test_helper'

class AmazonGiftCardsControllerTest < ActionController::TestCase
  setup do
    @amazon_gift_card = amazon_gift_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amazon_gift_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amazon_gift_card" do
    assert_difference('AmazonGiftCard.count') do
      post :create, amazon_gift_card: { code: @amazon_gift_card.code, used: @amazon_gift_card.used }
    end

    assert_redirected_to amazon_gift_card_path(assigns(:amazon_gift_card))
  end

  test "should show amazon_gift_card" do
    get :show, id: @amazon_gift_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @amazon_gift_card
    assert_response :success
  end

  test "should update amazon_gift_card" do
    put :update, id: @amazon_gift_card, amazon_gift_card: { code: @amazon_gift_card.code, used: @amazon_gift_card.used }
    assert_redirected_to amazon_gift_card_path(assigns(:amazon_gift_card))
  end

  test "should destroy amazon_gift_card" do
    assert_difference('AmazonGiftCard.count', -1) do
      delete :destroy, id: @amazon_gift_card
    end

    assert_redirected_to amazon_gift_cards_path
  end
end
