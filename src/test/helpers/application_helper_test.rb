require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    #指定したタイトルが帰ってきているかのテスト
    assert_equal full_title, "Idea mixer"
    assert_equal full_title("このサイトについて"), "このサイトについて | Idea mixer"
  end
end
