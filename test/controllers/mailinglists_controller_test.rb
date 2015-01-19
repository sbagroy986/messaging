require 'test_helper'

class MailinglistsControllerTest < ActionController::TestCase
  setup do
    @mailinglist = mailinglists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailinglists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailinglist" do
    assert_difference('Mailinglist.count') do
      post :create, mailinglist: { list: @mailinglist.list, name: @mailinglist.name }
    end

    assert_redirected_to mailinglist_path(assigns(:mailinglist))
  end

  test "should show mailinglist" do
    get :show, id: @mailinglist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailinglist
    assert_response :success
  end

  test "should update mailinglist" do
    patch :update, id: @mailinglist, mailinglist: { list: @mailinglist.list, name: @mailinglist.name }
    assert_redirected_to mailinglist_path(assigns(:mailinglist))
  end

  test "should destroy mailinglist" do
    assert_difference('Mailinglist.count', -1) do
      delete :destroy, id: @mailinglist
    end

    assert_redirected_to mailinglists_path
  end
end
