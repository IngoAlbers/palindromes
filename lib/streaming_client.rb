require_relative 'twitter_client'
require_relative 'rest_client'

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

      # Remove hashtags and mentions and filter only letters
      essence = object.text.downcase.gsub(/\B[@#]\S+\b/, '').gsub(/[^a-z]/, '')

      # Skip palindromes that are too short (single letters, etc.)
      next if essence.length < min_length.to_i

      rest_client.client.retweet(object) if essence == essence.reverse
    end
  end
end
