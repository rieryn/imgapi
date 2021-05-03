require "test_helper"

class ImgItemsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get imgItems url" do
    get '/img_items/'
    assert_response :success
  end
end
