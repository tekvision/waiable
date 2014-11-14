require './test/test_helper'
#require './lib/waiable/helpers/tabpanel_helper

describe "tabpanel_for" do
  it "should generate the tabpanel" do
    xml = XmlSimple.xml_in(%%
      <div id="tabpanel1" class="tabpanel" role="application">
        <ul id="tabpanel1_list" class="tablist" role=> "tablist">
          <li id="tabpanel1_tab_0" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel1_t_0_p_0"></li>
          <li id="tabpanel1_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel1_t_1_p_1"></li>
          <li id="tabpanel1_tab_2" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel1_t_2_p_2"></li>
          <li id="tabpanel1_tab_3" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel1_t_3_p_3"></li>
        </ul>
        <div id="tabpanel1_t_0_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_0" aria-hidden="false">
        </div> 
        <div id="tabpanel1_t_1_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_1" aria-hidden="true">
        </div> 
        <div id="tabpanel1_t_2_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_2" aria-hidden="true">
        </div> 
        <div id="tabpanel1_t_3_p_3" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_3" aria-hidden="true">
        </div> 
      </div>%)
    buffer = tabpanel_for(:id => "tabpanel1", :tabcount => "4")
    asert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end
end
