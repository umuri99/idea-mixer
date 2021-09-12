require "test_helper"

class FavoriteTest < ActiveSupport::TestCase

  def setup
    @favorite = Favorite.new(user_id: users(:michael).id,
                             post_id: posts(:orange).id)
  end

  #有効なお気に入り登録のテスト
  test "should be valid" do
    assert @favorite.valid?
  end

  #お気に入り登録するときに必ずuser_idの情報が必要なことをテスト
  test "should require a user_id" do
    @favorite.user_id = nil
    assert_not @favorite.valid?
  end

  #お気に入り登録するときに必ずpost_idの情報が必要なことをテスト
  test "should require a post_id" do
    @favorite.post_id = nil
    assert_not @favorite.valid?
  end

end
