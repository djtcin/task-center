require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post :create, submission: { comment: @submission.comment, grade: @submission.grade, lastUpdate: @submission.lastUpdate, remember: @submission.remember, studentId: @submission.studentId, submitted: @submission.submitted, viewed: @submission.viewed }
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should show submission" do
    get :show, id: @submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission
    assert_response :success
  end

  test "should update submission" do
    put :update, id: @submission, submission: { comment: @submission.comment, grade: @submission.grade, lastUpdate: @submission.lastUpdate, remember: @submission.remember, studentId: @submission.studentId, submitted: @submission.submitted, viewed: @submission.viewed }
    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission
    end

    assert_redirected_to submissions_path
  end
end