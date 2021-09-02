require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:orange)
  end

  #投稿一覧画面に繋がるかのテスト
  test "should get index" do
    get posts_path
    assert_response :success
  end

  #ログインしていない状態で新規投稿をしようとしてあらログイン画面にリダイレクトするテスト
  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  #ログインしていない状態で投稿の削除をしようとした時にログイン画面にリダイレクト
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end

  #自分以外のユーザーの投稿を削除しようとすると、ルートURLにリダイレクトされることをテスト
  test "should redirect destroy for wrong post" do
    log_in_as(users(:archer))
    post = posts(:post_1)
    assert_no_difference 'Post.count' do
      delete post_path(post)
    end
    assert_redirected_to root_url
  end

end
