require "test_helper"

class Base64imgsControllerTest < ActionDispatch::IntegrationTest

  test "should get base64imgs url" do
    get '/base64imgs'
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end
end
