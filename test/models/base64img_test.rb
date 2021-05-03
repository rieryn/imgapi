require "test_helper"

class Base64imgTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid Base64img' do
    base64img = Base64img.new(img_title: 'tester')
    assert base64img.valid?
  end
end
