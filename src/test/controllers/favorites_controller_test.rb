require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest

  #ログインしずにcreateアクションを呼び出そうとすると、ログイン画面へリダイレクト
  test "create should require logged-in user" do
    assert_no_difference 'Favorite.count' do
      post favorites_path
    end
    assert_redirected_to login_url
  end

  #ログインしずにdestroyアクションを呼び出そうとすると、ログイン画面へリダイレクト
  test "destroy should require logged-in user" do
    assert_no_difference 'Favorite.count' do
      delete favorite_path(favorites(:one))
    end
    assert_redirected_to login_url
  end

end
