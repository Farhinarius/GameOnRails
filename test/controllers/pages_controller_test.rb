require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get game1" do
    get pages_game1_url
    assert_response :success
  end

  test "should get game2" do
    get pages_game2_url
    assert_response :success
  end

end
