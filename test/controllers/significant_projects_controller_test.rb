require "test_helper"

class SignificantProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @significant_project = significant_projects(:one)
  end

  test "should get index" do
    get significant_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_significant_project_url
    assert_response :success
  end

  test "should create significant_project" do
    assert_difference("SignificantProject.count") do
      post significant_projects_url, params: { significant_project: { title: @significant_project.title } }
    end

    assert_redirected_to significant_project_url(SignificantProject.last)
  end

  test "should show significant_project" do
    get significant_project_url(@significant_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_significant_project_url(@significant_project)
    assert_response :success
  end

  test "should update significant_project" do
    patch significant_project_url(@significant_project), params: { significant_project: { title: @significant_project.title } }
    assert_redirected_to significant_project_url(@significant_project)
  end

  test "should destroy significant_project" do
    assert_difference("SignificantProject.count", -1) do
      delete significant_project_url(@significant_project)
    end

    assert_redirected_to significant_projects_url
  end
end
