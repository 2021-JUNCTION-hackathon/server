require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  describe '#index' do
    test "Success" do
      get homes_url
      res = JSON.parse(response.body)
      
      assert_response :success
      assert res['response']['payload']['is_good']
      assert_equal 'hello, world!', res['response']['meta']['message']
    end
  end
end
