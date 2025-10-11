# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'should be valid by default' do
    assert @user.valid?
  end

  test 'should have some posts' do
    assoc = User.reflect_on_association(:posts)
    assert_equal :has_many, assoc.macro
  end

  test 'should destroy associated posts' do
    user = users(:one)
    post = posts(:one)

    assert_difference('Post.count', -1) do
      user.destroy
    end

    assert_raises(ActiveRecord::RecordNotFound) { post.reload }
  end
end
