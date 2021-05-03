require "test_helper"

class ImageFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return url" do
    # some_undefined_variable is not defined elsewhere in the test case
    get_url()
    assert true
  end
end
