require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  #メールアドレスが正しくてパスワードが間違いのログイン失敗テスト
  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email:    @user.email,
                                          password: "invalid" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  #ログインした状態とログアウトした状態ドロワーメニューの内容が切り替わっているかのテスト
  test "login with valid information" do
    get login_path
    #ログインした状態
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
    #後でお気に入りページと登録情報の変更ページのリンクがなくなる事についてもテストを追記しないといけない

    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    #ログアウトした状態
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url

    # 2番目のウィンドウでログアウトをクリックするユーザーをシミュレートする
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    #後でお気に入りページと登録情報の変更ページのリンクについてもテストを追記しないといけない
  end

  #「次回から自動ログイン」チェックボックスにチェックを入れてログインすると、cookieにremember_tokenが保存されるテスト
  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_equal cookies['remember_token'], assigns(:user).remember_token
  end

  #ログアウトするとremember_tokenのcookieが消えるかどうか確認のテスト
  test "login without remembering" do
    # cookieを保存してログイン
    log_in_as(@user, remember_me: '1')
    delete logout_path
    # cookieを削除してログイン
    log_in_as(@user, remember_me: '0')
    assert_empty cookies[:remember_token]
  end
end
