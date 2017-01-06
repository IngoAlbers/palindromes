require_relative 'twitter_client'

class StreamingClient
  include TwitterClient

  def initialize
    load_credentials
    stream
  end

  def client
    Twitter::Streaming::Client.new { |config| init_config(config) }
  end

  def stream
    client.sample do |object|
      if object.is_a?(Twitter::Tweet)
        $rest_client.retweet(object) if object.text == object.text.reverse
      end
    end
  end
end
