require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should validate_numericality_of(:age).is_less_than(100)
  # test "the truth" do
  #   assert true
  # end
  #
end
