require 'test_helper'
class WaiableFormBuilderTest < ActionView::TestCase
  test "testing label with id attribute" do
    #expect = '<label id="label_person_name" for="person_name">Name</label>'
    expect = 'id="label_person_name"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.label :name
      assert_match(expect, actual)
    end #form_for
  end

#  test "testing text_field with aria-labelledby attribute" do
    #expect = '<input type="text" id="person_name" name="person[name]" aria-labelledby="label_person_name"/>'
#    expect = 'aria-labelledby="label_person_name"'

#    form_buffer = form_for :person, url: "dummy" do |f|
#      actual = f.text_field :name
#      assert_match(expect, actual)
    #end #form_for
#  end

  test "testing text_field with aria-required attribute for mandatory fields " do
    expect = 'aria-required="true"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name, :maxlength => "20"
      assert_match(expect, actual)
    end
  end

  test "testing text_field with maxlength attribute" do
    expect = 'aria-describedby="maxlength_label_person_name"'
    extra_content = '<div id="maxlength_person_name" value="You can enter maxmum 20 character in this field"></div>'
    expect + extra_content

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name, :maxlength => "20"
      assert_match(expect, actual)
    end
  end

  test "testing email_field with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_email"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.email_field :email
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

  test "testing password_field with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_password"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.password_field :password
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

  test "testing text_area with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_address"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_area :address
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

  test "testing radio_button with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_gender"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.radio_button(:gender, "Male") 
      assert_match(expect, actual)
    end
  end

  test "testing date_field with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_dateofbirth"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.date_field :dateofbirth
      assert_match(expect, actual)
    end
  end

  test "testing date_field with aria-required attribute for mandatory field" do
    expect = 'aria-required="true"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.date_field :dateofbirth
      assert_match(expect, actual)
    end
  end

  test "testing check_box with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_publish"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.check_box :publish
      assert_match(expect, actual)
    end
  end

  test "testing search_field with aria-label attribute" do
    expect = 'aria-label="Search"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.search_field :name
      assert_match(expect, actual)
    end
  end

  test "testing search_field with title attribute" do
    expect = 'title="Search"'
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.search_field :name
      assert_match(expect, actual)
    end
  end

  test "testing datetime_field with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_joindate"'
  
    form_buffer = form_for :person,  url: "dummy" do |f|
      actual = f.datetime_field :joindate
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

  test "testing phone_field with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_mobile_number"'

    form_builder = form_for :person, url: "dummy" do |f|
      actual = f.phone_field :mobile_number
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

  test "testing select tag with aria-labelledby attribute" do
    expect = 'aria-labelledby="label_person_country"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.select(:email, [["pramod@gmail.com, 1"], ["tushar@gmail.com", 2], ["monoj@yahoo.in", 3], ["roshan@gmail.com", 4]])
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
end
