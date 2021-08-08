require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title="Idea mixer"
  end

  test "should get home" do
    # /にgetリクエストを送ってレスポンスが帰ってくるか
    get root_path
    assert_response :success
    #titleタグの中身が正しいか確認
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    # /aboutにgetリクエストを送ってレスポンスが帰ってくるのか確認
    get about_path
    assert_response :success
    #titleタグの中身が正しいか確認
    assert_select "title", "このサイトについて | #{@base_title}"
  end
end
