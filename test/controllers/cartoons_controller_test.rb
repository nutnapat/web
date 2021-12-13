require "test_helper"

class CartoonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartoon = cartoons(:one)
  end

  test "should get index" do
    get cartoons_url
    assert_response :success
  end

  test "should get new" do
    get new_cartoon_url
    assert_response :success
  end

  test "should create cartoon" do
    assert_difference('Cartoon.count') do
      post cartoons_url, params: { cartoon: { daytoupdate: @cartoon.daytoupdate, name: @cartoon.name, shortinfo: @cartoon.shortinfo, status: @cartoon.status, writer: @cartoon.writer } }
    end

    assert_redirected_to cartoon_url(Cartoon.last)
  end

  test "should show cartoon" do
    get cartoon_url(@cartoon)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartoon_url(@cartoon)
    assert_response :success
  end

  test "should update cartoon" do
    patch cartoon_url(@cartoon), params: { cartoon: { daytoupdate: @cartoon.daytoupdate, name: @cartoon.name, shortinfo: @cartoon.shortinfo, status: @cartoon.status, writer: @cartoon.writer } }
    assert_redirected_to cartoon_url(@cartoon)
  end

  test "should destroy cartoon" do
    assert_difference('Cartoon.count', -1) do
      delete cartoon_url(@cartoon)
    end

    assert_redirected_to cartoons_url
  end
end
