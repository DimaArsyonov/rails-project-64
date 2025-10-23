# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should create like' do
    assert_difference('PostLike.count', 1) do
      post post_likes_url(@post)
    end
    assert_redirected_to post_path(@post)
  end

  test 'should destroy like' do
    @like = PostLike.create!(post: @post, user: @user)
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post, @like)
    end
    assert_redirected_to post_path(@post)
  end
end
