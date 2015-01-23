class WaiableAssetUrlTest < ActionView::TestCase
  test "testing image_tag with alt attribute" do
    expect = assert_raises(Exception) {image_tag("techvision.png") if alt == ""}

    assert_equal("Message", expect.message)
  end

  test "testing decorative image_tag with alt attribute" do
    expect = 'alt="" decorative="true"'

    actual = image_tag("seperator.png")
    assert_match(expect, actual)
  end
end
