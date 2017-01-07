module Twitter
  class Tweet
    def palindrome?(min_length)
      essence = to_essence
      essence == essence.reverse && essence.length >= min_length
    end

    private

    def to_essence
      # Remove hashtags, mentions and any non letters
      text.downcase.gsub(/\B[@#]\S+\b|[^a-z]/, '')
    end
  end
end
