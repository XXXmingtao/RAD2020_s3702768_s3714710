require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment=comments(:alpha)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "content should not be empty" do
    @comment.content=""
    assert_not @comment.valid?
  end

  test "content should not be too long" do
    @comment.content= "a" * 300
    assert_not @comment.valid?
  end

end
