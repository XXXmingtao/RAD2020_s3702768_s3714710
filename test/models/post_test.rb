require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post=posts(:one)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should not be empty" do
    @post.title=""
    assert_not @post.valid?
  end

  test "content should not be empty" do
    @post.text=""
    assert_not @post.valid?
  end

  test "content should not be too long" do
    @post.text= "a" * 30000
    assert_not @post.valid?
  end

end
