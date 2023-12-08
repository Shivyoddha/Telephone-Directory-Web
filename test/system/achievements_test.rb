require "application_system_test_case"

class AchievementsTest < ApplicationSystemTestCase
  setup do
    @achievement = achievements(:one)
  end

  test "visiting the index" do
    visit achievements_url
    assert_selector "h1", text: "Achievements"
  end

  test "should create achievement" do
    visit achievements_url
    click_on "New achievement"

    fill_in "Description", with: @achievement.description
    fill_in "Year", with: @achievement.year
    click_on "Create Achievement"

    assert_text "Achievement was successfully created"
    click_on "Back"
  end

  test "should update Achievement" do
    visit achievement_url(@achievement)
    click_on "Edit this achievement", match: :first

    fill_in "Description", with: @achievement.description
    fill_in "Year", with: @achievement.year
    click_on "Update Achievement"

    assert_text "Achievement was successfully updated"
    click_on "Back"
  end

  test "should destroy Achievement" do
    visit achievement_url(@achievement)
    click_on "Destroy this achievement", match: :first

    assert_text "Achievement was successfully destroyed"
  end
end
