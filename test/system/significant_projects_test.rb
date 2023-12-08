require "application_system_test_case"

class SignificantProjectsTest < ApplicationSystemTestCase
  setup do
    @significant_project = significant_projects(:one)
  end

  test "visiting the index" do
    visit significant_projects_url
    assert_selector "h1", text: "Significant projects"
  end

  test "should create significant project" do
    visit significant_projects_url
    click_on "New significant project"

    fill_in "Title", with: @significant_project.title
    click_on "Create Significant project"

    assert_text "Significant project was successfully created"
    click_on "Back"
  end

  test "should update Significant project" do
    visit significant_project_url(@significant_project)
    click_on "Edit this significant project", match: :first

    fill_in "Title", with: @significant_project.title
    click_on "Update Significant project"

    assert_text "Significant project was successfully updated"
    click_on "Back"
  end

  test "should destroy Significant project" do
    visit significant_project_url(@significant_project)
    click_on "Destroy this significant project", match: :first

    assert_text "Significant project was successfully destroyed"
  end
end
