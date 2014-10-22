require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should validate_numericality_of(:age).is_less_than(100)

  def setup
    @weapon = Weapon.new
    @weapon.name = 'www'
    @zombie = Zombie.create!(name:'ten',age:18, weapon:@weapon)
  end

  test "decapitate should set status to dead again" do
    #using a stub
    @zombie.weapon.stubs(:slice)
    @zombie.decapitate
    assert_equal "dead again", @zombie.status
  end

  test "decapitate should call slice" do
    #using a mock : stub with an assertion that it got called
    @zombie.weapon.expects(:slice)
    @zombie.decapitate
  end
end
