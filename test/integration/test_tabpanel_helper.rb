require './test/test_helper'
#require './lib/waiable/helpers/tabpanel_helper

describe "tabpanel_for" do
  it "should generate the tabpanel" do
    xml = XmlSimple.xml_in(%%
      <div id="tabpanel1" class="tabpanel" role="application">
        <ul id="tabpanel1_list" class="tablist" role="tablist">
          <li id="tabpanel1_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel1_t_0_p_0"></li> 
          <li id="tabpanel1_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel1_t_1_p_1"></li> 
          <li id="tabpanel1_tab_2" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel1_t_2_p_2"></li> 
        </ul>
        <div id="tabpanel1_t_0_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_0" aria-hidden="true">
        </div>
        <div id="tabpanel1_t_1_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_1" aria-hidden="true">
        </div>
        <div id="tabpanel1_t_2_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel1_tab_2" aria-hidden="false">
        </div>  
    </div>%)
    buffer = tabpanel_for(:id => "tabpanel1", :tabcount => "4")
    asert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end

  it "should generate the horizontal tabpanel" do
    xml = XmlSimple.xml_in(%%
      <div id="tabpanel_1" class="horizontal-tabpanel" role="application">
        <ul id="tabpanel_1_list" class="tablist" role="tablist">
          <li id="tabpanel_1_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_1_t_0_p_0">Transcript
          </li> 
          <li id="tabpanel_1_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_1_t_1_p_1">Summary</li> 
          <li id="tabpanel_1_tab_2" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel_1_t_2_p_2">Take Test</li> 
        </ul>
        <div id="tabpanel_1_t_0_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_0" aria-hidden="true">
        </div>
        <div id="tabpanel_1_t_1_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_1" aria-hidden="true">
        </div>
        <div id="tabpanel_1_t_2_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_2" aria-hidden="false">
        </div>  
    </div>%)
    buffer = tabpanel_for(:id => "tabpanel_1", :horizontal => "true", :tabs => ["Transcript", "Summary", "Take Test"])
    asert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end

  it "should generate the tabpanel with data" do
   xml = XmlSimple.xml_in(%%
     <div id="tabpanel_2" class="tabpanel" role="application">
       <ul id="tabpanel_2_list" class="tablist" role="tablist">
         <li id="tabpanel_2_tab_0" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel_2_p_0">Home</li>
         <li id="tabpanel_2_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_1">User</li>
         <li id="tabpanel_2_tab_2" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_2">Products</li>
         <li id="tabpanel_2_tab_3" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_3">Contact Us</li>
        </ul>    
        <div id="tabpanel_2_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_0" aria-hidden="false">
        </div>
        <div id="tabpanel_2_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_1" aria-hidden="true">
        </div>
        <div id="tabpanel_2_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_2" aria-hidden="true">
        </div>
        <div id="tabpanel_2_p_3" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_3" aria-hidden="true">
        </div>
    </div>%) 
    buffer = tabpanel_for(:id => "tabpanel_2", :tabs => {"Home" => "", "User" => "", "Products" => "", "Contact Us" => ""})
    assert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end

  it "should generate nested tabpanel" do
    xml = XmlSimple.xml_in(%%
      <div id="tabpanel_1" class="horizontal-tabpanel" role="application">   
        <ul id="tabpanel_1_list" class="tablist" role="tablist">
          <li id="tabpanel_1_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_1_p_0">Home</li>
          <li id="tabpanel_1_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_1_p_1">Education</li>
          <li id="tabpanel_1_tab_2" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel_1_p_2">Vocation</li>
        </ul>
        <div id="tabpanel_1_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_0" aria-hidden="true">
          <div id="tabpanel_2" class="vertical-tabpanel">
            <ul id="tabpanel_2_list" class="tablist" role="tablist">
              <li id="tabpanel_2_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_0">
                Chocolate Making
              </li>
              <li id="tabpanel_2_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_1">
                Techvision
              </li>
              <li id="tabpanel_2_tab_2" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_2">
                Braile Library
              </li>
            </ul>
            <div id="tabpanel_2_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_0" aria-hidden="true">
            </div>
            <div id="tabpanel_2_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_1" aria-hidden="true">
            </div>
            <div id="tabpanel_2_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_2" aria-hidden="true">
            </div>
          </div>
        </div>
        <div id="tabpanel_1_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_1" aria-hidden="true">
          <div id="tabpanel_3" class="vertical-tabpanel">
            <ul id="tabpanel_3_list" class="tablist" role="tablist">
              <li id="tabpanel_3_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_3_p_0">
                Core Education
              </li>
              <li id="tabpanel_3_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_3_p_1">
                Result
              </li>
            </ul>
            <div id="tabpanel_3_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_3_tab_0" aria-hidden="true">
            </div>
            <div id="tabpanel_3_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_3_tab_1" aria-hidden="true">
            </div>
          </div>
        </div>
        <div id="tabpanel_1_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_2" aria-hidden="false">
          <div id="tabpanel_4" class="vertical-tabpanel">
            <ul id="tabpanel_4_list" class="tablist" role="tablist">
              <li id="tabpanel_4_tab_0" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel_4_p_0">
                Software Development
              </li>
              <li id="tabpanel_4_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_4_p_1">
                Placements
              </li>
              <li id="tabpanel_4_tab_2" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_4_p_2">
                Cards, Bags and flowers
              </li>
            </ul>
            <div id="tabpanel_4_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_4_tab_0" aria-hidden="false">
            </div>
            <div id="tabpanel_4_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_4_tab_1" aria-hidden="true">
            </div>
            <div id="tabpanel_4_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_4_tab_2" aria-hidden="true">
            </div>
          </div>
        </div>
      </div>%)
    buffer = tabpanel_for(:id => "tabpanel_1") do |tp|
      tp.tablist_contener(:tabs => ["Home", "Education", "Vocation"]).render
      tp.panel_contener tabpanel_for(:id, :horizontal => "false") do |ntp|
        ntp.tablist_contener(:tabs => [["Chocolate Making", "Techvision", "Braile Library"], ["Core Education", "Result"], ["Software Development", "Placements", "Cards, Bags and flowers"]]).render
        ntp.panel_contener().render
      end      
    end
    asert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2), xml)
  end
  
  it "should generate the nested tabpanel with tabpanel object" do
    xml = XmlSimple.xml_in(%%
      <div id="tabpanel_1" class="horizontal-tabpanel" role="application">   
        <ul id="tabpanel_1_list" class="tablist" role="tablist">
          <li id="tabpanel_1_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_1_p_0">Home</li>
          <li id="tabpanel_1_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_1_p_1">Education</li>
          <li id="tabpanel_1_tab_2" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel_1_p_2">Vocation</li>
        </ul>
        <div id="tabpanel_1_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_0" aria-hidden="true">
          <div id="tabpanel_2" class="vertical-tabpanel">
            <ul id="tabpanel_2_list" class="tablist" role="tablist">
              <li id="tabpanel_2_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_0">
                Chocolate Making
              </li>
              <li id="tabpanel_2_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_1">
                Techvision
              </li>
              <li id="tabpanel_2_tab_2" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_2_p_2">
                Braile Library
              </li>
            </ul>
            <div id="tabpanel_2_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_0" aria-hidden="true">
            </div>
            <div id="tabpanel_2_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_1" aria-hidden="true">
            </div>
            <div id="tabpanel_2_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_2_tab_2" aria-hidden="true">
            </div>
          </div>
        </div>
        <div id="tabpanel_1_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_1" aria-hidden="true">
          <div id="tabpanel_3" class="vertical-tabpanel">
            <ul id="tabpanel_3_list" class="tablist" role="tablist">
              <li id="tabpanel_3_tab_0" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_3_p_0">
                Core Education
              </li>
              <li id="tabpanel_3_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_3_p_1">
                Result
              </li>
            </ul>
            <div id="tabpanel_3_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_3_tab_0" aria-hidden="true">
            </div>
            <div id="tabpanel_3_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_3_tab_1" aria-hidden="true">
            </div>
          </div>
        </div>
        <div id="tabpanel_1_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_1_tab_2" aria-hidden="false">
          <div id="tabpanel_4" class="vertical-tabpanel">
            <ul id="tabpanel_4_list" class="tablist" role="tablist">
              <li id="tabpanel_4_tab_0" class="tab" role="tab" aria-selected="true" tabindex="0" aria-controls="tabpanel_4_p_0">
                Software Development
              </li>
              <li id="tabpanel_4_tab_1" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_4_p_1">
                Placements
              </li>
              <li id="tabpanel_4_tab_2" class="tab" role="tab" aria-selected="false" tabindex="-1" aria-controls="tabpanel_4_p_2">
                Cards, Bags and flowers
              </li>
            </ul>
            <div id="tabpanel_4_p_0" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_4_tab_0" aria-hidden="false">
            </div>
            <div id="tabpanel_4_p_1" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_4_tab_1" aria-hidden="true">
            </div>
            <div id="tabpanel_4_p_2" class="tabpanel" role="tabpanel" aria-labelledby="tabpanel_4_tab_2" aria-hidden="true">
            </div>
          </div>
        </div>
      </div>%)
    @tabpanel = tabpanel_for(:id => "tabpanel_1", :tabs => ["Home", "Education", "Vocation"])
    @tabpanel.render_tablist_contener
    @tabpanel.render_panel_contener do 
      @tp = tabpanel_for(:id, :horizontal => "false")
      @tp.tablist_contener(:tabs => [["Chocolate Making", "Techvision", "Braile Library"], ["Core Education", "Result"], ["Software Development", "Placements", "Cards, Bags and flowers"]])
      @tp.render_panel_contener
    end 
   asert_equal(XmlSimple.xml_in(@tabpanel, 'NormaliseSpace' => 2), xml) 
  end
end
