require 'minitest/autorun'
require './lib/waiable/helpers/helper'

 class TestGridHelper < ActionDispatch::IntegrationTest

  test "should generate a empty grid given Dimensions of rows and columns" do
    xml = XmlSimple.xml_in(%%
      <div id="grid1" role="grid" tabindex="-1" class="grid">
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
    buffer = grid_for(:grid1, :rows => 2, :columns => 2)
    assert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end

  test "should render a grid with data supplied as 2D array" do
    xml = XmlSimple.xml_in(%%
      <div id="grid1" role="grid" tabindex="-1" class="grid">
        <div id="grid1_row_0" class="row" role="row">
	  <div id="grid1_row_0_cell_0" class="gridcell" role="gridcell" tabindex="0" aria-selected="true" aria-labelledby="grid1_caption_0_0">
	    <p id="grid1_caption_0_0">Grid cell 1</p>
	  </div>
	  <div id="grid1_row_0_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid1_caption_0_1">
	    <p id="grid1_caption_0_1">Grid cell 2</p> 
	  </div>
	</div>
	<div id="grid1_row_1" class="row" role="row">
	  <div id="grid1_row_1_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid1_caption_1_0">
	    <p id="grid1_caption_1_0">Grid cell 3</p>
	  </div>
	  <div id="grid1_row_1_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid1_caption_1_1">
	    <p id="grid1_caption_1_1">Grid cell 4</p>
	  </div>
	</div>
      </div>%)
    buffer = grid_for(:grid1, :data => [["Grid cell 1", "Grid cell 2"], ["Grid cell 3", "Grid cell 4"]], :readonly => true)
    assert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end

  test "should generate a grid with header and data" do
    xml = XmlSimple.xml_in(%%
      <div id="grid_2" role="grid" tabindex="-1" class="grid">
        <div id="grid_2_row_header" class=" row header" role="row">
	  <div id="grid_2_Header_cell_0" class="header cell" role="gridcell" tabindex="-1" aria-selected="false">
	    Full Name
	  </div>
	  <div id="grid_2_Header_cell_1" class="header cell" role="gridcell" tabindex="-1" aria-selected="false">
	    Email
	  </div>
	  <div id="grid_2_Header_cell_2" class="header cell" role="gridcell" tabindex="-1" aria-selected="false">
	    Address
	  </div>
	</div>
	<div id="grid_2_row_0" class="row" role="row">
	  <div id="grid_2_row_0_cell_0" class="gridcell" role="gridcell" tabindex="0" aria-selected="true" aria-labelledby="grid_2_caption_0_0">
	    <p id="grid_2_caption_0_0">Pramod wagh</p>
	  </div>
          <div id="grid_2_row_0_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_2_caption_0_1">
	    <p id="grid_2_caption_0_1">pramodwagh@gmail.com</p>
	  </div>
	  <div id="grid_2_row_0_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_2_caption_0_2">
	    <p id="grid_2_caption_0_2">9881457875</p>
	  </div>
 	</div>
        <div id="grid_2_row_1" class="row" role="row">
	  <div id="grid_2_row_1_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="ogrid_2_caption_1_0">
	    <p id="grid_2_caption_1_0">Nitin Dhaware</p>
	  </div>
          <div id="grid_2_row_1_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_2_caption_1_1">
	    <p id="grid_2_caption_1_1">nitindhaware@gmail.com</p>
	  </div>
	  <div id="grid_2_row_1_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_2_caption_1_2">
	    <p id="grid_2_caption_1_2">9887456521</p>
	  </div>
 	</div>
      </div>%)
    buffer = grid_for(:grid_2, :data => [["Pramod wagh", "pramodwagh@gmail.com", "9881457875"], ["Nitin Dhaware", "nitindhaware@gmail.com", "9887456521"]], :header => ["First Name", "Email", "Address"], :readonly => true)
    assert_equal(XmlSimple.xml_in(buffer,'NormaliseSpace' => 2), xml)
  end

  test "should generate a grid with header and editable cells" do
    xml = XmlSimple.xml_in(%%
      <div id="grid_2" role="grid" tabindex="-1" class="grid">
        <div id="grid_2_row_header" class=" row header" role="row">
	  <div id="grid_2_Header_cell_0" class="header cell" role="gridcell" tabindex="-1" aria-selected="false">
	    Full Name
	  </div>
	  <div id="grid_2_Header_cell_1" class="header cell" role="gridcell" tabindex="-1" aria-selected="false">
	    Email
	  </div>
	  <div id="grid_2_Header_cell_2" class="header cell" role="gridcell" tabindex="-1" aria-selected="false">
	    Address
	  </div>
	</div>
	<div id="grid_2_row_0" class="row" role="row">
	  <div id="grid_2_row_0_cell_0" class="gridcell" role="gridcell" tabindex="0" aria-selected="true">
	  </div>
          <div id="grid_2_row_0_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	  <div id="grid_2_row_0_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
 	</div>
        <div id="grid_2_row_1" class="row" role="row">
	  <div id="grid_2_row_1_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
          <div id="grid_2_row_1_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	  <div id="grid_2_row_1_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
 	</div>
	<div id="grid_2_row_2" class="row" role="row">
	  <div id="grid_2_row_2_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
          <div id="grid_2_row_2_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	  <div id="grid_2_row_2_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false">
	  </div>
	</div>
      </div>%)
    buffer = grid_for(:grid_2, :rows => 3, :header => ["First Name", "Email", "Address"], :readonly => false)
    assert_equal(XmlSimple.xml_in('buffer, NormaliseSpace' => 2), xml)
  end

  test "should generate a grid with data and with default focus set on custom cell" do
    xml = XmlSimple.xml_in(%%
      <div id="grid_1" class="grid" role="grid" tabindex="-1" class="grid">
        <div id="grid_1_row_0" class="row" role="row">
          <div id="grid_1_row_0_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_0_0">
	    <p id="grid_1_caption_0_0">Prashant</p>
	  </div>
          <div id="grid_1_row_0_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_0_1">
	    <p id="grid_1_caption_0_1">prashant@rediffmail.com</p>
	  </div>
	  <div id="grid_1_row_0_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_0_2">
	    <p id="grid_1_caption_0_2">9881457821</p>
	  </div>
	</div>
	<div id="grid_1_row_1" class="row" role="row">
          <div id="grid_1_row_1_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_1_0">
	    <p id="grid_1_caption_1_0">Tushar</p>
	  </div>
          <div id="grid_1_row_1_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_1_1">
	    <p id="grid_1_caption_1_1">tusharkakade@hotmail.com</p>
	  </div>
	  <div id="grid_1_row_1_cell_2" class="gridcell" role="gridcell" tabindex="0" aria-selected="true" aria-labelledby="grid_1_caption_1_2">
	    <p id="grid_1_caption_1_2">9887458264</p>
	  </div>
	</div>
	<div id="grid_1_row_2" class="row" role="row">
          <div id="grid_1_row_2_cell_0" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_2_0">
	    <p id="grid_1_caption_2_0">Kavita</p>
	  </div>
          <div id="grid_1_row_2_cell_1" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_2_1">
	    <p id="grid_1_caption_2_1">kavita@gmail.com</p>
	  </div>
	  <div id="grid_1_row_2_cell_2" class="gridcell" role="gridcell" tabindex="-1" aria-selected="false" aria-labelledby="grid_1_caption_2_2">
	    <p id="grid_1_caption_2_2">8888854621</p>
	  </div>
	</div>
      </div>%) 
    buffer = grid_for(:grid_1, :data => [["Prashant", "prashant@rediffmail.com", "9881457821"], ["Tushar", "tusharkakade@hotmail.com", "9887458264"], ["Kavita", "kavita@gmail.com", "8888854621"]], :default_focus_cell => [1,2])
    asert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end

  test "should generate a grid element with grid_option, row_option, cell_option" do
    xml = XmlSimple.xml_in(%%
    <div id="grid_2" role="grid" class="grid game-levels no-focus" tabindex="-1">
      <div id="grid_2_row_0" class="row row-wise-container" role="row">
        <div id="grid_2_row_0_cell_0" class="gridcell col-lg-4 col-sm-4" role="gridcell" tabindex="0" aria-selected="true">
        </div>
        <div id="grid_2_row_0_cell_1" class="gridcell col-lg-4 col-sm-4" role="gridcell" tabindex="-1" aria-selected="false">
        </div>
        <div id="grid_2_row_0_cell_2" class="gridcell col-lg-4 col-sm-4" role="gridcell" tabindex="-1" aria-selected="false">
        </div>
      </div>
      <div id="grid_2_row_1" class="row row-wise-container" role="row">
	<div id="grid_2_row_1_cell_0" class="gridcell col-lg-4 col-sm-4" role="gridcell" tabindex="-1" aria-selected="false">
	</div>
        <div id="grid_2_row_1_cell_1" class="gridcell col-lg-4 col-sm-4" role="gridcell" tabindex="-1" aria-selected="false">
	</div>
	<div id="grid_2_row_1_cell_2" class="gridcell col-lg-4 col-sm-4" role="gridcell" tabindex="-1" aria-selected="false">
	</div>
      </div>
    </div>%)
    buffer = grid_for(:grid_2, :readonly => false, :grid_option{:class => game-levels no-focus}, :rows_option{:class => row-wise-container}, :cell_option{:class => col-lg-4 col-sm-4})
    assert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end
end
