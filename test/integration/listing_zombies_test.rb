require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  test 'returns list of all zombies' do
    get '/zombies', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns zombies filtered by weapon' do
    Zombie.create!(name:'John', weapon: 'axe')
    Zombie.create!(name:'Joannie', weapon:'poison')

    get '/zombies?weapon=poison', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status

    zombies = json(response.body)
    Rails.logger.info response.body
    names = zombies.collect { |z| z[:name] }
    assert_includes names, 'Joannie'
    refute_includes names, 'John'
  end

  test 'returns zombie by id' do
    zombie = Zombie.create!(name: 'fav', weapon:'smile')
    get "/zombies/#{zombie.id}"
    assert_equal 200, response.status
    zombie_response = json(response.body)
    assert_equal zombie.name, zombie_response[:name]
  end
end
