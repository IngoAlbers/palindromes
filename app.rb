require_relative 'lib/rest_client'
require_relative 'lib/streaming_client'

def run
  $rest_client = RestClient.new
  streaming_client = StreamingClient.new
end

run
