require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    user = users(:matheus)
    get :show, id: user.id
    assert_response :success
  end

  test "should create new user" do
    post :create, { name: "Marie", email: "marie@me.com", sex: "female", birthday: "1991-07-25" }
    assert_response :success
    assert_not_nil assigns(:user).id
  end

  test "should not create new user with invalid parameters" do
    post :create, { name: "Marie", email: "invalidemail.com", sex: "female" }
    assert_not assigns(:user).valid?
    assert_response 400
  end

  test "should edit existing user" do
    user = users(:matheus)
    patch :update, { id: user.id, email: "vmatheus.mariano@gmail.com" }
    assert_response :success
    assert_equal "vmatheus.mariano@gmail.com", assigns(:user).email
  end

  test "should not edit user with invalid parameters" do
    user = users(:matheus)
    patch :update, { id: user.id, email: "invalidemail.com" }
    assert_response 400
  end

  test "should delete existing user" do
    user = users(:matheus)
    delete :destroy, { id: user.id }
    assert_response :success
  end

  test "should set email as unavailable" do
    user = users(:matheus)
    post :email, email: user.email
    assert_response :success
    assert_not assigns(:available)
  end

  test "should set email as available" do
    post :email, email: "available.email@me.com"
    assert_response :success
    assert assigns(:available)
  end
end
