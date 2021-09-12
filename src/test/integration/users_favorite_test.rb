require "test_helper"

class UsersFavoriteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @post = posts(:orange)
    log_in_as(@user)
  end

  #お気に入りページで自分のお気に入り投稿一覧が表示されるかテスト
  test "favorite page" do
    get favorite_user_path(@user)
    assert_not @user.favorite_posts.empty?
    @user.favorite_posts.each do |post|
      assert_select "a[href=?]", post_path(post)
    end
  end

  #投稿を置き入り登録するテスト
  test "should favorite a user the standard way" do
    assert_difference '@user.favorite_posts.count', 1 do
      post favorites_path, params: { post_id: @post.id }
    end
  end

  #Ajaxで投稿をお気に入り登録するテスト
  test "should favorite a user with Ajax" do
    assert_difference '@user.favorite_posts.count', 1 do
      post favorites_path, params: { post_id: @post.id }, xhr: true
    end
  end

  #投稿のお気に入り解除のテスト
  test "should unfavorite a user the standard way" do
    @user.favorite(@post)
    favorite = @user.favorites.find_by(post_id: @post.id)
    assert_difference '@user.favorite_posts.count', -1 do
      delete favorite_path(favorite), params: { post_id: @post.id}
    end
  end

  #Ajax通信でのお気に入り登録解除のテスト
  test "should unfollow a user with Ajax" do
    @user.favorite(@post)
    favorite = @user.favorites.find_by(post_id: @post.id)
    assert_difference '@user.favorite_posts.count', -1 do
      delete favorite_path(favorite), xhr: true, params: { post_id: @post.id}
    end
  end

end
