require 'test_helper'
class WaiableFormBuilderTest < ActionView::TestCase
  test "testing label with id attribute" do
    expect = 'id="label_person_name"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.label :name
      assert_match(expect, actual)
    end #form_for
  end

  test "testing text_field with aria-required attribute for mandatory fields " do
    expect = 'aria-required="true"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name, :maxlength => "20"
      assert_match(expect, actual)
    end
  end

  test "testing text_field with maxlength attribute" do
    expect = 'aria-describedby="maxlength_person_name"'
    extra_content = '<div id="maxlength_person_name"> You can enter maxmum 20 character in this field</div>'.html_safe
    expect + extra_content

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name, :maxlength => "20"
      assert_match(expect, actual)
    end
  end

  test "testing email_field with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.email_field :email
      assert_match(expect, actual)
    end
  end

  test "testing password_field with aria-required attribute" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.password_field :password
      assert_match(expect, actual)
    end
  end

  test "testing text_area with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_area :address
      assert_match(expect, actual)
    end
  end

  test "testing date_field with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.date_field :joindate
      assert_match(expect, actual)
    end
  end

  test "testing search_field with aria-label attribute" do
    expect = 'aria-label="search name"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.search_field :name
      assert_match(expect, actual)
    end
  end

  test "testing datetime_field with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.datetime_field :joindate
      assert_match(expect, actual)
    end
  end

  test "testing phone_field with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.phone_field :mobile_number
      assert_match(expect, actual)
    end
  end

  test "testing select tag with aria-required attribute for manditary field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.select(:country, [["India", 1], ["Chaina", 2], ["Pakisthan", 3]])
      assert_match(expect, actual)
    end
  end


  test "testing the error element with error object" do
    person = ValidatePerson.new
    person.valid?

    form_buffer = form_for person, url: "dummy", as: "person_form" do |f|
      person.errors.full_messages.each do |msg|   
         expect = "<div id=\"error_validateperson_name\"><a href=\"javascript:document.getElementsByName('validateperson[name]')[0].focus()\">Name can't be blank</a></div>"
        actual = msg
        assert_match(expect, actual)
      end
    end
end

  test "testing radio_button with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.radio_button :gender, "male"
      assert_match(expect, actual)
    end
  end

  test "testing date_select with aria-required attribute" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.date_select :dateofbirth
      assert_match(expect, actual)
    end
  end
end


