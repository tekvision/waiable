require 'minitest/autorun'
require './lib/waiable'

class TestWaiable < Minitest::Test
  include Waiable
  def test_link_to_with_text
    assert_equal('<a href="http://www.example.com">Hello</a>', link_to("Hello", "http://www.example.com"))
  end

  def test_link_to_with_image
    assert_equal('<a href="http://www.example.com"><img src="image.jpg" alt="This is an image"></a>', link_to(image_tag("image.jpg", {:alt => "This is an image"}), "http://www.example.com"))
  end

  def test_table_for_with_summary
    assert_equal('<table summary="This is table summary"></table>', table_for({summary: "This is table summary"))
  end

  def test_table_for_with_headers
    assert_equal('<table> <tr> <th>Header</th> </tr> </table>', table_for(column_headers[Header]))
  end

  def test_form_for

  end


end