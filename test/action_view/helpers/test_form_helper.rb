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
    
    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name
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
end
