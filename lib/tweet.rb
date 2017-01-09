module Twitter
  class Tweet
    def palindrome?(min_length)
      essence = to_essence
      essence.length >= min_length && essence == essence.reverse
    end

    private

    def to_essence
      # Remove hashtags, mentions and any non letters
      text.downcase.gsub(/\B[@#]\S+\b|[^a-z]/, '')
    end
  end
end
