require 'test_helper'
require './lib/waiable/widgets/grid'

class AccessibleGridTest < ActionView::TestCase
  def with_grid_for(:id, data = {}, Option = {})
    
  end

  test "should be generate the div element with id attribute" do
    with_grid_for :id => 'grid1', @level, &block
    assert_select 'div#grid1'
  end

  test "should be generate the div element with role attribute" do
    with_grid_for :id => 'grid1', @level, &block
    assert_select 'div[role: "grid"]'
  end

  test "should be generate the div element with tabindex attribute" do
    with_grid_for :id, @level, &block
    assert_select 'div[tabindex: => '-1']'
  end

  test "should be generate the div element with aria-selected attribute" do
    with_grid_for :id, @level, &block
    assert_select 'div[aria-selected: false]'
  end
end
