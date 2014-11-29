require './test/test_helper'

describe "text_field" do

  it "should generate label with id attribute" do
    html = '<label id="label_person_first_name" for="person_first_name">First name</label>:'
    buffer = form_for @person do |f|
      f.label :first_name:      
    end
    assert_equal(html, buffer)
  end

  it "should generate text field with label associated using aria-labelledby attribute" do
    html = '<input type="text" id="person_first_name" name="person[first_name]" aria-labelledby="label_person_first_name"/>'  
    buffer =form_for @person do |f|
      f.text_field :first_name 
    end 
    assert_equal(html, buffer)
  end

  it "mandet fields should generate the aria-required attribute" do
    html = '<input type="text" id="user_first_name" name="user[first_name]" aria-labelledby="label_user_first_name" aria-required="true"/>'
    buffer = form_for @user do |f|
      f.text_field :first_name
    end 
    assert_equal(html, buffer)
  end
end


