require "test_helper"

class ImageFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "compare should return 0 for equal hash" do
    imageFile = ImageFile.new
    imageFile.avg_hash = "1001"
    assert imageFile.compare("1001") == 0
  end
  test "compare should return >0 for unequal hash" do
    imageFile = ImageFile.new
    imageFile.avg_hash = "1011"
    assert imageFile.compare("1001") > 0
  end
  test "process_img should hash image to bit string" do
    imageFile = ImageFile.new
    attatched_image = imageFile.image.attach(io: File.open("/test.png"), filename: "test.png", content_type: "image/png")
    imageFile.save
    assert(imageFile.process_img.is_a?(String))
  end
  test "should not save ImageFile without image" do
    imageFile = ImageFile.new
    assert !imageFile.save, "saved ImageFile without image"
  end
  test 'valid ImageFile' do
    imageFile = ImageFile.new(image_title: 'tester')
    imageFile.image.attach(io: File.open("/test.png"), filename: "test.png", content_type: "image/jpg")
    assert imageFile.valid?
  end
end
