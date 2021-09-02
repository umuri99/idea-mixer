require "test_helper"

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "post interface" do

    log_in_as(@user)
    get root_path
    assert_select "h2", "Mixer"

    # 無効な投稿画面へのGetリクエスト
    get new_post_path, params: { theme: { theme1: "" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div.alert_danger", "テーマ１を入力してください"

    # 有効な投稿画面へのGetリクエスト
    theme1 = "サンプルテーマ１"
    get new_post_path, params: { theme: { theme1: theme1 } }
    assert_response :success
    assert_select "div", theme1
    assert_select "input[type=submit][value=?]", "やり直す"
    assert_select "input[type=submit][value=?]", "投稿する"
    assert_select "input[type=text]#post_title", count: 1
    assert_select "textarea#post_content", count: 1

    #無効な投稿の送信
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { theme1: theme1, theme2: "サンプルテーマ２", title: "", content: "" } }
    end
    assert_select 'div#error_explanation'

    #有効な投稿の送信
    title = "サンプルアイデアタイトル"
    content = "サンプルコンテンツテキスト"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { theme1: theme1, theme2: "サンプルテーマ２", title: title, content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div.alert_success", "投稿完了"

    # 投稿を削除する
    get post_path(posts(:orange))
    assert_template 'posts/show'
    assert_select "a", text: "削除"
    assert_difference 'Post.count', -1 do
      delete post_path(posts(:orange))
    end

    # 他のユーザーの投稿の詳細ページに削除リンクがないことを確認,投稿者以外のdeleteリクエストを受付ないことをテスト
    get post_path(posts(:cat_video))
    assert_template 'posts/show'
    assert_select "a", text: "削除", count: 0
    assert_difference 'Post.count', 0 do
      delete post_path(posts(:cat_video))
    end

  end

end
