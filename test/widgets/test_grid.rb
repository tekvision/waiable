require 'test_helper'
require './lib/waiable/widgets/grid'

class AccessibleGridTest < ActionView::TestCase
  def with_grid_for(:id, data = {}, Option = {})
    
  end

  def with_row_for(:grid_id, &block, r_index)
  end

  test "should be generate the div element with id attribute" do
    with_grid_for :id => 'grid1', @data, &block
    assert_select 'div#grid1'
  end

  test "should be generate the div element with role attribute" do
    with_grid_for :id => 'grid1', @data, &block
    assert_select 'div[role: "grid"]'
  end

  test "should be generate the div element with tabindex attribute" do
    with_grid_for :id, @data, &block
    assert_select 'div[tabindex: => '-1']'
  end

  test "should be generate the div element with aria-selected attribute" do
    with_grid_for :id, @data, &block
    assert_select 'div[aria-selected: false]'
  end

  test "should be generate the row with id attribute" do
    with_grid_for :grid_id, @data, &block do |g, r_index|
      g.with_row_for :grid_id, &block, r_index
      assert_select 'div[id: "#{grid_id}_row_#{r_index}"]'
    end
  end

  test "should be generate the row with role attribute" do
    with_grid_for :grid_id, @data, &block do |g, r_index|
      g.with_row_for :grid_id, &block, r_index
      assert_select 'div[role: "row"]'
    end
  end

  test "should be generate the row element with class attribute" do
    with_grid_for :grid_id, @data, &block do |g, r_index|
      g.with_row_for :grid_id, &block, r_index
      assert_select 'div[class: '#{&block{:row_class}}']'
    end
  end

  test "should be generate the row element with optional HTML attributes" do
    with_grid_for :grid_id, @data, &block do |g, r_index|
      g.with_row_for :grid_id, &block, r_index
      assert_select 'div[ input_html: {&block}]'
    end
  end
end
