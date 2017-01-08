require 'twitter'
require 'tweet'

RSpec.describe Twitter::Tweet do
  describe '#palindrome?' do
    it 'returns false when the text is not a palindrome' do
      tweet = Twitter::Tweet.new(id: 1, text: 'Hello')
      expect(tweet.palindrome?(4)).to be false
    end

    it 'returns true when the text is a palindrome longer than min length' do
      tweet = Twitter::Tweet.new(id: 1, text: 'racecar')
      expect(tweet.palindrome?(4)).to be true
    end

    it 'returns false when the palidnrome length is shorter than min length' do
      tweet = Twitter::Tweet.new(id: 1, text: 'wow')
      expect(tweet.palindrome?(4)).to be false
    end

    it 'returns true when the text is a palindrome ignoring capitalization' do
      tweet = Twitter::Tweet.new(id: 1, text: 'Racecar')
      expect(tweet.palindrome?(4)).to be true
    end

    it 'returns true when the text is a palindrome ignoring punctuation' do
      tweet = Twitter::Tweet.new(id: 1, text: 'Race. Car!')
      expect(tweet.palindrome?(4)).to be true
    end

    it 'returns true when the text is a palindrome ignoring mentions' do
      tweet = Twitter::Tweet.new(id: 1, text: '@twitteruser racecar')
      expect(tweet.palindrome?(4)).to be true
    end

    it 'returns true when the text is a palindrome ignoring hashtags' do
      tweet = Twitter::Tweet.new(id: 1, text: 'racecar #racing #car')
      expect(tweet.palindrome?(4)).to be true
    end
  end
end
