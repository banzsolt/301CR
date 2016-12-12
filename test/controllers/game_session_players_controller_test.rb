require 'test_helper'

class GameSessionPlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_session_player = game_session_players(:one)
  end

  test "should get index" do
    get game_session_players_url
    assert_response :success
  end

  test "should get new" do
    get new_game_session_player_url
    assert_response :success
  end

  test "should create game_session_player" do
    assert_difference('GameSessionPlayer.count') do
      post game_session_players_url, params: { game_session_player: { game_session_id: @game_session_player.game_session_id, player_id: @game_session_player.player_id } }
    end

    assert_redirected_to game_session_player_url(GameSessionPlayer.last)
  end

  test "should show game_session_player" do
    get game_session_player_url(@game_session_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_session_player_url(@game_session_player)
    assert_response :success
  end

  test "should update game_session_player" do
    patch game_session_player_url(@game_session_player), params: { game_session_player: { game_session_id: @game_session_player.game_session_id, player_id: @game_session_player.player_id } }
    assert_redirected_to game_session_player_url(@game_session_player)
  end

  test "should destroy game_session_player" do
    assert_difference('GameSessionPlayer.count', -1) do
      delete game_session_player_url(@game_session_player)
    end

    assert_redirected_to game_session_players_url
  end
end
