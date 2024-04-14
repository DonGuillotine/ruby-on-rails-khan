require "application_system_test_case"

class FriendspassesTest < ApplicationSystemTestCase
  setup do
    @friendspass = friendspasses(:one)
  end

  test "visiting the index" do
    visit friendspasses_url
    assert_selector "h1", text: "Friendspasses"
  end

  test "should create friendspass" do
    visit friendspasses_url
    click_on "New friendspass"

    fill_in "Email", with: @friendspass.email
    fill_in "First name", with: @friendspass.first_name
    fill_in "Last name", with: @friendspass.last_name
    fill_in "Phone", with: @friendspass.phone
    fill_in "Twitter", with: @friendspass.twitter
    click_on "Create Friendspass"

    assert_text "Friendspass was successfully created"
    click_on "Back"
  end

  test "should update Friendspass" do
    visit friendspass_url(@friendspass)
    click_on "Edit this friendspass", match: :first

    fill_in "Email", with: @friendspass.email
    fill_in "First name", with: @friendspass.first_name
    fill_in "Last name", with: @friendspass.last_name
    fill_in "Phone", with: @friendspass.phone
    fill_in "Twitter", with: @friendspass.twitter
    click_on "Update Friendspass"

    assert_text "Friendspass was successfully updated"
    click_on "Back"
  end

  test "should destroy Friendspass" do
    visit friendspass_url(@friendspass)
    click_on "Destroy this friendspass", match: :first

    assert_text "Friendspass was successfully destroyed"
  end
end
