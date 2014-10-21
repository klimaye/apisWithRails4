require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def test_invalid_without_a_name
    z = Zombie.new
    assert !z.valid?, "Name is not being validated"
  end

  test "valid with all attributes" do
    z = Zombie.new
    z.name = "Prajya"
    z.age = 32
    assert z.valid?, "Zombie not valid"
  end
end
