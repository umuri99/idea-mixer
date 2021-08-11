require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  #無効なアカウント作成のテスト
  test "invalid signup information" do
    get signup_path
    #users_pathへ無効な情報でPostリクエストを送ってもデータベースの数が増えてないことを確認
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    #エラーメッセージが表示されていることを確認
    assert_select 'div#error_explanation'
    assert_select 'div.alert_danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

end
