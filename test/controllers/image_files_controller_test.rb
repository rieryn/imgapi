require "test_helper"

class ImageFilesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #test_image = Rack::Test::UploadedFile.new('test.png','image/png')
  test "should get image file search url" do
    get "/image_files/search"
    assert_response :success
  end
  #test "should create image file" do
  #  post '/image_files', params: { image_title: "test", image: test_image}
  #  assert_response :success
  #end
  
end
