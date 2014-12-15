class WaiableAssetUrlTest < ActionView::TestCase
  test "testing image_tag with alt attribute" do
    expect = 'alt="Techvision logo"'

    actual = image_tag("techvision.png")
    assert_match(expect, actual)
  end

  test "testing decorative image_tag with alt attribute" do
    expect = 'alt="" decorative="true"'

    actual = image_tag("seperator.png")
    assert_match(expect, actual)
  end
end
