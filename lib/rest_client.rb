require 'twitter'
require_relative 'twitter_client'

class RestClient
  include TwitterClient

  def initialize
    load_credentials
  end

  def tw_client
    Twitter::REST::Client.new { |config| init_config(config) }
  end
end
