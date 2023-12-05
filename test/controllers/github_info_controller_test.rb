require 'test_helper'

class GithubInfoControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get github_info_index_url
    assert_response :success
  end
end
