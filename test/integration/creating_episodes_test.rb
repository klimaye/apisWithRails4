require 'test_helper'

class CreatingEpisodesTest < ActionDispatch::IntegrationTest

  test 'create episodes' do
    body =  {
        episode:
        {
          title: 'Crazy Cat',
          description:'I got one crazy cat'
        }
    }.to_json
    post '/episodes',
      body,
    { 'Accept' => Mime::JSON,
      'Content-Type' => Mime::JSON.to_s
    }
    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    episode = json(response.body)
    assert_equal episode_url(episode[:id]), response.location
  end

  test 'does not create episodes with title nil' do
    body = {
      episode: { title: nil, description:'abcd' }
    }.to_json
    post '/episodes', body,
      {
      'Accept' => Mime::JSON,
      'Content-Type' => Mime::JSON.to_s
    }

      assert_equal 422, response.status
      assert_equal Mime::JSON, response.content_type
  end
end
