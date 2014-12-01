require './test/test_helper'
require 'action_view/helpers'
require 'action_view/helpers/form_helper'

describe "form_for" do
  form_buffer = ::ActionView::Helpers::FormHelper::form_for @person do |f|
  it "should generate label with id attribute" do
    html = '<label id="label_person_first_name" for="person_first_name">First name</label>'
    buffer = f.label :first_name
    assert_equal(html, buffer)
  end

  it "should generate text field with label associated using aria-labelledby attribute" do
    html = '<input type="text" id="person_first_name" name="person[first_name]" aria-labelledby="label_person_first_name"/>'
    buffer = f.text_field :first_name
    assert_equal(html, buffer)
  end

  it "should generate aria-required attribute for mandatory fields." do
    html = '<input type="text" id="user_first_name" name="user[first_name]" aria-labelledby="label_user_first_name" aria-required="true"/>'
    buffer = f.text_field :first_name
    assert_equal(html, buffer)
    end
  end#form_for
end#describe
