require_relative 'twitter_client'

class RestClient
  include TwitterClient

  def initialize
    load_credentials
  end

  def client
    Twitter::REST::Client.new { |config| init_config(config) }
  end

  def retweet(tweet)
    client.retweet(tweet)
  end
end
