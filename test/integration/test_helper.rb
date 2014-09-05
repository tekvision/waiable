require 'minitest/autorun'
require './lib/waiable/helpers/helper'

 class HelperTest < ActionDispatch::IntegrationTest

  test "should be able render a grid element with id attribute" do
    assert_equal('<div id = "grid1"></div>', grid_for("grid1"))
  end

  test "should be able to generate a grid element with rows and cells" do
    xml = XmlSimple.xml_in(%%
      <div id="grid1" row="grid" tabindex="-1" aria-selected="false">
        <div id="grid1_row_0" class="row" role="row">
	  <div id="grid1_row_0_cell_0" class="gridcell" role="gridcell" tabindex="0" aria-selected="true">
	  </div>
	  <div id="grid1_row_0_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	</div>
	<div id="grid1_row_1" class="row" role="row">
	  <div id="grid1_row_1_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	  <div id="grid1_row_1_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	</div>
      </div>%)
      assert_equal(XmlSimple.xml_in('NormaliseSpace' => 2), xml)
  end
end
