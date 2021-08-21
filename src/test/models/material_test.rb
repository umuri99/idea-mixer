require "test_helper"

class MaterialTest < ActiveSupport::TestCase
  def setup
    @material = Material.new(theme: "Example theme")
  end

  #既に登録済みのthemeを登録拒否するテスト
  test "theme should be unique" do
    duplicate_material = @material.dup
    @material.save
    assert_not duplicate_material.valid?
  end
end
