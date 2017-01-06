require 'optparse'
require_relative 'lib/streaming_client'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: bundle exec ruby app.rb [options]'

  opts.separator ''
  opts.separator 'Available options:'

  options[:min_length] = 4
  opts.on('-m', '--min LENGTH', 'Minimum length of palindrome') do |v|
    options[:min_length] = v
  end

  opts.on('-h', '--help', 'Show this message') do
    puts opts
    exit
  end
end.parse!

StreamingClient.new(options)
