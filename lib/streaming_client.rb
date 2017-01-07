require_relative 'twitter_client'
require_relative 'rest_client'
require_relative 'tweet'

class StreamingClient < TwitterClient
  def initialize(options)
    super

    stream(options[:min_length])
  end

  private

  def client
    @client ||= init_client(Twitter::Streaming::Client)
  end

  def rest_client
    RestClient.current
  end

  def stream(min_length)
    client.sample do |object|
      # Check only english tweets
      next unless object.is_a?(Twitter::Tweet) && object.lang == 'en'

      rest_client.client.retweet(object) if object.palindrome?(min_length)
    end
  end
end
