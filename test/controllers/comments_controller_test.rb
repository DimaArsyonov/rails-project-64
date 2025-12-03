# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
    @comment = post_comments(:one)
    sign_in @user
  end

  test 'should get new' do
    get new_post_comment_url(@post, @comment)
    assert_response :success
  end

  test 'should create comment' do
    assert_difference('@post.comments.count') do
      post post_comments_url(@post), params: { post_comment: { content: 'This is a new comment.' } }
    end
    assert_redirected_to post_path(@post)
  end

  test 'should get reply' do
    parent_comment = @comment
    post post_comments_url(@post), params: {
      comment: {
        body: 'Reply',
        parent_id: parent_comment.id
      }
    }
    assert_response :success
  end
end
