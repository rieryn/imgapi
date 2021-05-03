require "test_helper"

class ImgItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "tests running" do
    assert true
  end
  test 'valid imgItem' do
    imgItem = ImgItem.new(img_title: 'tester', img_title: 'test.com',img_user: 'test')
    assert imgItem.valid?
  end
  
end
