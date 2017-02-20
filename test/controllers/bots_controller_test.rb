require 'test_helper'

class BotsControllerTest < ActionDispatch::IntegrationTest
  test "should get crawl" do
    get bots_crawl_url
    assert_response :success
  end

  test "should get detection" do
    get bots_detection_url
    assert_response :success
  end

  test "should get edit" do
    get bots_edit_url
    assert_response :success
  end

  test "should get index" do
    get bots_index_url
    assert_response :success
  end

  test "should get new" do
    get bots_new_url
    assert_response :success
  end

  test "should get show" do
    get bots_show_url
    assert_response :success
  end

end
