require "test_helper"

class Base64imgsControllerTest < ActionDispatch::IntegrationTest

  test "should get base64imgs url" do
    get '/base64imgs'
    assert_response :success
  end
  test "should create base64imgs" do
    post '/base64imgs', params: { img_title: "test", img_data:"base64string" }
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end
end
