require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_index_url
    assert_response :success
  end

  test "should get playerWon" do
    get api_playerWon_url
    assert_response :success
  end

  test "should get playerLost" do
    get api_playerLost_url
    assert_response :success
  end

end
