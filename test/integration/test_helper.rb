require 'minitest/autorun'
require './lib/waiable/helpers/helper'

 class HelperTest < ActionDispatch::IntegrationTest

  test "should render a grid element with id attribute" do
    assert_equal('<div id = "grid1"></div>', grid_for("grid1"))
  end

  test "should generate a grid element with rows and cells" do
    xml = XmlSimple.xml_in(%%
      <div id="grid1" role="grid" tabindex="-1" aria-selected="false">
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

  test "should be able to generate a grid element with role attribute" do
    xml = XmlSimple.xml_in(%%
      <div role="grid">
        <div role="row">
	  <div role="gridcell"></div>
	</div>
      </div>%)  
    assert_equal(XmlSimple.xml_in('NormaliseSpace' => 2, xml), grid_for(:grid1, rows => 2, columns => 2))
  end

  test "should render a grid element with data" do
    xml = XmlSimple.xml_in(%%
      <div id="grid1" role="grid" tabindex="-1" aria-selected="false">
        <div id="grid1_row_0" class="row" role="row">
	  <div id="grid1_row_0_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid1_caption_1">
	    <p id="grid1_caption_1">Grid cell 1</p>
	  </div>
	  <div id="grid1_row_0_cell_1" class="gridcell" role="gridcell" tabindex="0" aria-selected="true" aria-labelledby="grid1_caption_2">
	    <p id="grid1_caption_2">Grid cell 2</p> 
	  </div>
	</div>
	<div id="grid1_row_1" class="row" role="row">
	  <div id="grid1_row_1_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid1_caption_3">
	    <p id="grid1_caption_3">Grid cell 3</p>
	  </div>
	  <div id="grid1_row_1_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid1_caption_4">
	    <p id="grid1_caption_4">Grid cell 4</p>
	  </div>
	</div>
      </div>%)
    assert_equal(XmlSimple.xml_in('NormaliseSpace' => 2), xml), grid_for(:grid1, data => [["Grid cell 1", "Grid cell 2"], ["Grid cell 3", "Grid cell 4"]]))
  end
end
