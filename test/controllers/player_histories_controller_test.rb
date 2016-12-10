require 'test_helper'

class PlayerHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_history = player_histories(:one)
  end

  test "should get index" do
    get player_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_player_history_url
    assert_response :success
  end

  test "should create player_history" do
    assert_difference('PlayerHistory.count') do
      post player_histories_url, params: { player_history: { game_id: @player_history.game_id, player_id: @player_history.player_id, rank: @player_history.rank } }
    end

    assert_redirected_to player_history_url(PlayerHistory.last)
  end

  test "should show player_history" do
    get player_history_url(@player_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_history_url(@player_history)
    assert_response :success
  end

  test "should update player_history" do
    patch player_history_url(@player_history), params: { player_history: { game_id: @player_history.game_id, player_id: @player_history.player_id, rank: @player_history.rank } }
    assert_redirected_to player_history_url(@player_history)
  end

  test "should destroy player_history" do
    assert_difference('PlayerHistory.count', -1) do
      delete player_history_url(@player_history)
    end

    assert_redirected_to player_histories_url
  end
end
