require 'yaml'
require 'twitter'

class TwitterClient
  def initialize
    load_credentials
  end

  def init_client(type)
    type.new { |config| init_config(config) }
  end

  private

  def load_credentials
    creds = File.join(__dir__, '../config/twitter.yml')
    @twitter_config = YAML.load_file(creds)
  end

  def init_config(config)
    config.consumer_key = @twitter_config['consumer_key']
    config.consumer_secret = @twitter_config['consumer_secret']
    config.access_token = @twitter_config['access_token']
    config.access_token_secret = @twitter_config['access_token_secret']
  end
end
