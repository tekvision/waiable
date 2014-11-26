require './test/test_helper'

describe "text_field" do

  it "should generate label with id attribute" do
    xml = XmlSimple.xml_in(%%
      <form action="/people" class="new_person" id="new_person" method="post">
        <div style="display:none">
          <input name="authenticity_token" type="hidden" value="NrOp5bsjoLRuK8IW5+dQEYjKGUJDe7TQoZVvq95Wteg=" />
        </div>
        <label id="label_person_first_name" for="person_first_name">First name</label>:
      </form>
    %)
    buffer = form_for @person do |f|
      f.label :first_name:      
    end
    assert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2, xml))
  end

  it "should generate text field with label associated using aria-labelledby attribute" do
    xml = XmlSimple.xml_in(%%
      <form action="/people" class="new_person" id="new_person" method="post">
        <div style="display:none">
          <input name="authenticity_token" type="hidden" value="NrOp5bsjoLRuK8IW5+dQEYjKGUJDe7TQoZVvq95Wteg=" />
        </div>
        <label id="label_person_first_name" for="person_first_name">First name</label>:
        <input type="text" id="person_first_name" name="person[first_name]" aria-labelledby="label_person_first_name"/>  
      </form>
    %)
    buffer =form_for @person do |f|
      f.label :first_name:      
      f.text_field :first_name 
    end 
    assert_equal(XmlSimple.xml_in(buffer, 'NormaliseSpace' => 2, xml))
  end
end
