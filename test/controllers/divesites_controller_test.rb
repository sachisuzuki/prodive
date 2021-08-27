require 'test_helper'

class DivesitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get divesites_index_url
    assert_response :success
  end

  test "should get show" do
    get divesites_show_url
    assert_response :success
  end

end
