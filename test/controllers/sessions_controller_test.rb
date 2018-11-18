require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    # get sessions_new_url
    get login_path 
    #/login にgetリクエストするのと同じこと
    #上記のGETの結果レスポンスがsuccessだったらテストOKってこと
    assert_response :success
  end


end
