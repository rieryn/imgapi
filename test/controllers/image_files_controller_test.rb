require "test_helper"

class ImageFilesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should get image file search url" do
    get "/image_files/search"
    assert_response :success
  end
  
end
