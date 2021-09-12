require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  #自分の投稿一覧ページのテスト
  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h2', text: @user.name + "の投稿"
    assert_select 'div.title>img.gravatar'
    assert_select 'ul.pagination'

    @user.posts.page(1).per(8).each do |post|
      assert_match post.title, response.body
      assert_match post.theme1, response.body
      assert_match post.theme2, response.body
      assert_match "投稿者:" + @user.name, response.body
      assert_match "投稿日:" + post.created_at.strftime("%Y年%m月%d日"), response.body
    end

  end
end
