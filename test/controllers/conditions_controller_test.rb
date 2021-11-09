require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get conditions_index_url
    assert_response :success
  end
end
