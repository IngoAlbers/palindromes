require_relative 'twitter_client'

class RestClient
  include TwitterClient

  def client
    Twitter::REST::Client.new { |config| init_config(config) }
  end

  def self.current
    @current ||= RestClient.new
  end
end
