module Twitter
  class Tweet
    def palindrome?(min_length)
      essence = to_essence
      essence == essence.reverse && essence.length >= min_length
    end

    private

    def to_essence
      # Remove hashtags and mentions and filter only letters
      text.downcase.gsub(/\B[@#]\S+\b/, '').gsub(/[^a-z]/, '')
    end
  end
end
