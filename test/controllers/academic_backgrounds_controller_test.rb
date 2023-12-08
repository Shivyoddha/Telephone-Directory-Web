require "test_helper"

class AcademicBackgroundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_background = academic_backgrounds(:one)
  end

  test "should get index" do
    get academic_backgrounds_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_background_url
    assert_response :success
  end

  test "should create academic_background" do
    assert_difference("AcademicBackground.count") do
      post academic_backgrounds_url, params: { academic_background: { college: @academic_background.college, degree: @academic_background.degree, year: @academic_background.year } }
    end

    assert_redirected_to academic_background_url(AcademicBackground.last)
  end

  test "should show academic_background" do
    get academic_background_url(@academic_background)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_background_url(@academic_background)
    assert_response :success
  end

  test "should update academic_background" do
    patch academic_background_url(@academic_background), params: { academic_background: { college: @academic_background.college, degree: @academic_background.degree, year: @academic_background.year } }
    assert_redirected_to academic_background_url(@academic_background)
  end

  test "should destroy academic_background" do
    assert_difference("AcademicBackground.count", -1) do
      delete academic_background_url(@academic_background)
    end

    assert_redirected_to academic_backgrounds_url
  end
end
