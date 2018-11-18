require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
 test "login with invalid information" do 
  get login_path #/login へgetリクエストを送る
  assert_template 'sessions/new' # ？？？？
  post login_path, params: { session: {email: "", passwoed: ""}}
  assert_template 'sessions/new' # ?????
  assert_not flash.empty? # flashのハッシュが空じゃないこと
  get root_path # /
  assert flash.empty? # flashのハッシュがからかどうか

 end

end
