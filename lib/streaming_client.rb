require 'twitter'
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
      puts object.id if object.is_a?(Twitter::Tweet)
    end
  end
end
