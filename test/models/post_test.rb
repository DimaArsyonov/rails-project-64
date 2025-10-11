# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test 'should be valid by default' do
    assert @post.valid?
  end

  test 'title should be present' do
    @post.title = '   '
    assert_not @post.valid?
  end

  test 'body should be present' do
    @post.body = '   '
    assert_not @post.valid?
  end

  test 'category should be present' do
    @post.category = nil
    assert_not @post.valid?
  end
end
