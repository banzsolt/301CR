require 'test_helper'

class PlayerAwardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_award = player_awards(:one)
  end

  test "should get index" do
    get player_awards_url
    assert_response :success
  end

  test "should get new" do
    get new_player_award_url
    assert_response :success
  end

  test "should create player_award" do
    assert_difference('PlayerAward.count') do
      post player_awards_url, params: { player_award: { award_id: @player_award.award_id, player_id: @player_award.player_id } }
    end

    assert_redirected_to player_award_url(PlayerAward.last)
  end

  test "should show player_award" do
    get player_award_url(@player_award)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_award_url(@player_award)
    assert_response :success
  end

  test "should update player_award" do
    patch player_award_url(@player_award), params: { player_award: { award_id: @player_award.award_id, player_id: @player_award.player_id } }
    assert_redirected_to player_award_url(@player_award)
  end

  test "should destroy player_award" do
    assert_difference('PlayerAward.count', -1) do
      delete player_award_url(@player_award)
    end

    assert_redirected_to player_awards_url
  end
end
