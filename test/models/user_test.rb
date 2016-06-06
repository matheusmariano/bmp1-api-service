require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should refuse empty name" do
    user = User.create name: "", email: "john@me.com"
    invalid_name = user.errors.messages.key? :name
    assert invalid_name, "User accepted without name"
  end

  test "should refuse empty email" do
    user = User.create name: "John", email: ""
    invalid_email = user.errors.messages.key? :email
    assert invalid_email, "User accepted without email"
  end

  test "should refuse invalid email" do
    user = User.create name: "John", email: "Invalid Email"
    invalid_email = user.errors.messages.key? :email
    assert invalid_email, "User accepted with an invalid email"
  end

  test "should refuse repeated email" do
    matheus = users(:matheus)
    impostor = User.create name: "Impostor", email: matheus.email
    invalid_email = impostor.errors.messages.key? :email
    assert invalid_email, "User accepted with a repeated email"
  end

  test "should enumerate sex code" do
    user = users(:matheus)
    assert user.male?
    assert_equal "male", user.sex
  end

  test "should set invalid birthday to nil" do
    john = User.create name: "John", email: "john@me.com", sex: 2, birthday: '1991-02-30'
    assert_nil john.birthday, "User accepted with an invalid birthday"

    matheus = users(:matheus)
    assert_not_nil matheus.birthday, "User refused with a valid birthday"
  end
end
