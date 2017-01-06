require_relative 'twitter_client'

class RestClient < TwitterClient
  def client
    @client ||= init_client(Twitter::REST::Client)
  end

  def self.current
    @current ||= RestClient.new
  end
end
