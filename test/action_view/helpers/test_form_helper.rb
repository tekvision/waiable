class WaiableFormBuilderTest < ActionView::TestCase
  test "testing label" do
    #expect = '<label id="label_person_name" for="person_name">Name</label>'
    expect = 'id="label_person_name"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.label :name
      assert_match(expect, actual)
    end #form_for
  end

  test "testing text_field" do
    #expect = '<input type="text" id="person_name" name="person[name]" aria-labelledby="label_person_name"/>'
    expect = 'aria-labelledby="label_person_name"'

    form_buffer = form_for :person, url: "dummy" do |f|
      actual = f.text_field :name
      assert_match(expect, actual)
    end #form_for
  end
end
