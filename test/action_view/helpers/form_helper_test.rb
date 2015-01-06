class WaiableFormBuilderTest < ActionView::TestCase
  test "testing label with id attribute" do
    #expect = '<label id="label_person_name" for="person_name">Name</label>'
    expect = 'id="label_person_name"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.label :name
      assert_match(expect, actual)
    end #form_for
  end

  test "testing text_field with aria-labelledby attribute" do
    #expect = '<input type="text" id="person_name" name="person[name]" aria-labelledby="label_person_name"/>'
    expect = 'aria-labelledby="label_person_name"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name
      assert_match(expect, actual)
    end #form_for
  end

  test "testing text_field with aria-required attribute for mandatory fields " do
    expect = 'aria-required="true"'
    
    form_buffer = form_for :validatingperson, url: "dummy" do |f|
      actual = f.text_field :name, :required => true
      assert_match(expect, actual)
    end
  end

  test "testing text_field with maxlength attribute" do
    expect =  '<input type="text" id="person_name" name="person[name]" aria-labelledby="label_person_name" maxlength="20" aria-describedby="person_name_description"/>
      <p id="person_name_description" class="hidden">Maximum 20 character is required.</p>'
    

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
    
    form_buffer = form_for :validatingperson, url: "dummy" do |f|
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

    form_buffer = form_for :validatingperson, url: "dummy" do |f|
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

    form_buffer = form_for :validatingperson, url: "dummy" do |f|
      actual = f.text_area :address
      assert_match(expect, actual)
    end
  end

  test "testing text_area with maxlength attribute" do
    expect =  '<textarea id="person_address" name="person[address]" aria-labelledby="label_person_address" maxlength="50" aria-describedby="person_address_description">
    </textarea>
      <p id="person_address_description" class="hidden">Maximum 50 character is required.</p>'

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

    form_buffer = form_for :validatingperson, url: "dummy" do |f|
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

    form_buffer = form_for :validatingperson, url: "dummy" do |f|
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

    form_buffer = form_for :validatingperson, url: "dummy" do |f|
      actual = f.phone_field :mobile_number
      assert_match(expect, actual)
    end
  end
end