# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get home_index_url
    assert_response :success
  end

  test 'index should display posts' do
    get home_index_url
    assert_select 'h5.card-title', text: @post.title
    assert_select 'p.card-text.mb-2', text: @post.body
  end
end
