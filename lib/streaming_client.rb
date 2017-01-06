require_relative 'twitter_client'
require_relative 'rest_client'

class StreamingClient < TwitterClient
  def initialize
    super

    stream
  end

  private

  def client
    @client ||= init_client(Twitter::Streaming::Client)
  end

  def rest_client
    RestClient.current
  end

  def stream
    client.sample do |object|
      next unless object.is_a?(Twitter::Tweet)
      rest_client.client.retweet(object) if object.text == object.text.reverse
    end
  end
end
