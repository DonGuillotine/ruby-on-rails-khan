require "test_helper"

class FriendspassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friendspass = friendspasses(:one)
  end

  test "should get index" do
    get friendspasses_url
    assert_response :success
  end

  test "should get new" do
    get new_friendspass_url
    assert_response :success
  end

  test "should create friendspass" do
    assert_difference("Friendspass.count") do
      post friendspasses_url, params: { friendspass: { email: @friendspass.email, first_name: @friendspass.first_name, last_name: @friendspass.last_name, phone: @friendspass.phone, twitter: @friendspass.twitter } }
    end

    assert_redirected_to friendspass_url(Friendspass.last)
  end

  test "should show friendspass" do
    get friendspass_url(@friendspass)
    assert_response :success
  end

  test "should get edit" do
    get edit_friendspass_url(@friendspass)
    assert_response :success
  end

  test "should update friendspass" do
    patch friendspass_url(@friendspass), params: { friendspass: { email: @friendspass.email, first_name: @friendspass.first_name, last_name: @friendspass.last_name, phone: @friendspass.phone, twitter: @friendspass.twitter } }
    assert_redirected_to friendspass_url(@friendspass)
  end

  test "should destroy friendspass" do
    assert_difference("Friendspass.count", -1) do
      delete friendspass_url(@friendspass)
    end

    assert_redirected_to friendspasses_url
  end
end
