require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
  end

  test "should be valid" do
    assert @user.valid?
  end

  #nameが空白では登録できないことの確認
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  #emailが空白では登録できないことの確認
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  #nameが指定21文字以上だと登録できないことの確認
  test "name should not be too long" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  #emailが256文字（db255文字以上保存できないため)以上の場合だと登録できないことの確認
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  #emailアドレスの登録の際に承認されるアドレスの確認
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  #emailアドレスの登録の際に承認されないアドレスの確認
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  #既に登録済みのemailアドレスを登録拒否するテスト
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  #emailを登録時に小文字に変換して保存しているか確認
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  #パスワードが空白文字では登録できないことを確認
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  #パスワードが8文字以上じゃないと登録できないことを確認
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

end
