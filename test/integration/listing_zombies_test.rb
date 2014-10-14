require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  test 'returns list of all zombies' do
    get '/zombies'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns zombies filtered by weapon' do
    Zombie.create!(name:'John', weapon: 'axe')
    Zombie.create!(name:'Joannie', weapon:'poison')

    get '/zombies?weapon=poison'
    assert_equal 200, response.status

    zombies = json(response.body)
    names = zombies.collect { |z| z[:name] }
    assert_includes names, 'Joannie'
    refute_includes names, 'John'
  end
end
