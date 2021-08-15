require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  #アカウント作成画面に繋がるかのテスト
  test "should get new" do
    get signup_path
    assert_response :success
  end

  #登録情報変更ページにアクセスしようとした時にログインしていなかったらログインページにリダイレクトするテスト
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  #updateアクションを実行しようとした時にログインしていなかったらログインページにリダイレクトするテスト
  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

#現在ログインしているユーザーとは違うユーザーの登録情報変更ページにアクセスしようとした時に、ルートURLにリダイレクトするテスト
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  #現在ログインしているユーザーとは違うユーザに対してupdateアクションを実行しようとした時に、ルートURLにリダイレクトするテスト
  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
