require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
 #投稿一覧画面に繋がるかのテスト
  test "should get index" do
    get posts_path
    assert_response :success
  end
end
