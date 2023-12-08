require "application_system_test_case"

class AcademicBackgroundsTest < ApplicationSystemTestCase
  setup do
    @academic_background = academic_backgrounds(:one)
  end

  test "visiting the index" do
    visit academic_backgrounds_url
    assert_selector "h1", text: "Academic backgrounds"
  end

  test "should create academic background" do
    visit academic_backgrounds_url
    click_on "New academic background"

    fill_in "College", with: @academic_background.college
    fill_in "Degree", with: @academic_background.degree
    fill_in "Year", with: @academic_background.year
    click_on "Create Academic background"

    assert_text "Academic background was successfully created"
    click_on "Back"
  end

  test "should update Academic background" do
    visit academic_background_url(@academic_background)
    click_on "Edit this academic background", match: :first

    fill_in "College", with: @academic_background.college
    fill_in "Degree", with: @academic_background.degree
    fill_in "Year", with: @academic_background.year
    click_on "Update Academic background"

    assert_text "Academic background was successfully updated"
    click_on "Back"
  end

  test "should destroy Academic background" do
    visit academic_background_url(@academic_background)
    click_on "Destroy this academic background", match: :first

    assert_text "Academic background was successfully destroyed"
  end
end
