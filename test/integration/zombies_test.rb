require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
  test "Anyone can see zombie info" do
    @zombie = Zombie.create!(name:'ten',age:18, weapon:@weapon)
    get api_zombie_url(@zombie)
    assert_response :success
    assert_select "h1", @zombie.name
  end
end
