require_relative 'twitter_client'
require_relative 'rest_client'
require_relative 'tweet'

class StreamingClient < TwitterClient
  def initialize(options)
    super
    @min_length = options[:min_length]
    @language = options[:language]

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
    retries = 5

    client.sample do |object|
      next unless object.is_a?(Twitter::Tweet) && object.lang == @language

      rest_client.client.retweet(object) if object.palindrome?(@min_length)
    end

  # Retry after disconnect https://github.com/sferik/twitter/issues/535
  rescue EOFError
    raise e if (retries -= 1).zero?

    sleep 10
    retry
  end
end
