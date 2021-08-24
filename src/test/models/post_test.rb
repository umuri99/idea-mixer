require "test_helper"

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @post = @user.posts.build(title: "タイトル", content: "コンテンツ", theme1: "テーマ１", theme2: "テーマ２")
  end

  #@postが有効であるかテスト
  test "should be valid" do
    assert @post.valid?
  end

  #ユーザーIDがあることと、必要であることをテスト
  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  #title,theme1,theme2,contentがそれぞれ存在していないと、登録できないようにするテスト
  test "content should be present" do
    @post.title = "   "
    assert_not @post.valid?
    @post.title = "タイトル"
    @post.theme1 = "   "
    assert_not @post.valid?
    @post.theme1 = "テーマ１"
    @post.theme2 = "   "
    assert_not @post.valid?
    @post.theme2 = "テーマ２"
    @post.content = "   "
    assert_not @post.valid?
  end

  #Postテーブルを操作する時最新のものが上に来るようにするテスト
  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

end
