require "test_helper"

class ImageFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "compare should return 0 for equal hash" do
    image = ImageFile.new
    image.avg_hash = "1001"
    assert image.compare("1001") == 0
  end
  test "compare should return >0 for unequal hash" do
    image = ImageFile.new
    image.avg_hash = "1011"
    assert image.compare("1001") > 0
  end
  test "process_img should hash image to bit string" do
    imagefile = ImageFile.new
    attatched_image = imagefile.image.attach(io: File.open("/test.png"), filename: "test.png", content_type: "image/jpg")
    imagefile.save
    assert(imagefile.process_img.is_a?(String))
  end
  test "should not save ImageFile without title" do
    image = ImageFile.new
    assert !image.save, "saved iamge without a title"
  end
end
