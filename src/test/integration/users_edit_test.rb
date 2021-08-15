require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  #ユーザー情報編集失敗時のテスト
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select 'div.alert', "The form contains 4 errors."
  end

  #ユーザー情報編集成功時のテストとフレンドリーフォワーディングのテスト
  test "successful edit and friendly forwarding" do
    get edit_user_path(@user)#ログインしていない状態でユーザー情報編集ページへアクセス
    assert_equal session[:forwarding_url], edit_user_url(@user)#sessionにアクセスしようとしたページのURLが保存される
    log_in_as(@user)#ログインする
    assert_nil session[:forwarding_url]#先ほどsession[:forwarding_url]に保存されていたURLが削除されているのを確認する
    assert_redirected_to edit_user_url(@user)#先ほどアクセスしようとしていた編集ページに自動的にアクセスされる
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end

end
