require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
  test "Anyone can see zombie info" do
    @zombie = Zombie.create!(name:'ten',age:18, weapon:@weapon)
    visit api_zombie_url(@zombie)
    assert_equal api_zombie_path(@zombie), current_path
    within("h1") do
      assert has_content?(@zombie.name)
    end
  end
end
