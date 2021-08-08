require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    # /にゲットリクエストを送る
    get root_path
    # テンプレートが正しいか確認
    assert_template 'static_pages/home'
    # aタグの指定リンク先が正しくあるか確認
    assert_select "a[href=?]", root_path, count:2
    assert_select "a[href=?]", about_path
    #/aboutのgetリクエストを送る
    get about_path
    assert_select "title", full_title("このサイトについて")
  end
end
