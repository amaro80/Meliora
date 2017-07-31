require 'test_helper'

class WinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get wines_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_url
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post wines_url, params: { wine: { country: @wine.country, image_url: @wine.image_url, name: @wine.name, rating: @wine.rating, string: @wine.string, string: @wine.string, type_wine: @wine.type_wine, upc: @wine.upc, user_id: @wine.user_id, user_id: @wine.user_id, vineyard_id: @wine.vineyard_id, vineyard_id: @wine.vineyard_id, wine_year: @wine.wine_year } }
    end

    assert_redirected_to wine_url(Wine.last)
  end

  test "should show wine" do
    get wine_url(@wine)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_url(@wine)
    assert_response :success
  end

  test "should update wine" do
    patch wine_url(@wine), params: { wine: { country: @wine.country, image_url: @wine.image_url, name: @wine.name, rating: @wine.rating, string: @wine.string, string: @wine.string, type_wine: @wine.type_wine, upc: @wine.upc, user_id: @wine.user_id, user_id: @wine.user_id, vineyard_id: @wine.vineyard_id, vineyard_id: @wine.vineyard_id, wine_year: @wine.wine_year } }
    assert_redirected_to wine_url(@wine)
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete wine_url(@wine)
    end

    assert_redirected_to wines_url
  end
end
