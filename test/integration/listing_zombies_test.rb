require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  test 'returns list of all zombies' do
    get '/zombies'
    assert_equal 200, response.status
    refute_empty response.body
  end
end
