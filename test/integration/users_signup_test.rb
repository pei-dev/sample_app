require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count',1 do
      post users_path, params: { user: { name: "Example User",
                                  email: "user@example.com",
                                  password:     "password",
                                  password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?



    assert_no_difference 'User.count' do
      post signup_path, params: {user: {name: "",
                                email: "user@invalid",
                                password: "foo",
                                password_confirmation: "bar" }}
    end
    assert_template 'users/new'

    # 7.3.4の演習(未実施) 
    assert_select 'form[action="/signup"]'
    assert_select 'div#error_explanation' #idの指定は#でする
    assert_select 'div.field_with_errors' #クラスの指定はドット.でする

 end
end
