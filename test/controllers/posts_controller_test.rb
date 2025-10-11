# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { title: 'New Post', body: 'This is a new post.', category_id: categories(:one).id } }
    end

    assert_redirected_to post_path(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
