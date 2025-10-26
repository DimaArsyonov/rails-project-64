# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
  end

  test 'should be valid by default' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = '   '
    assert_not @category.valid?
  end

  test 'name should not be valid if it does not exist' do
    @category.name = nil
    assert_not @category.valid?
  end
end
