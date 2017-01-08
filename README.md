palindromes
=================

Ruby App that consumes the [Twitter Streaming API](https://dev.twitter.com/docs/api/streaming) and retweets any Tweets that are palindromes.

Requirements
============

To run this app, you will need the following dependencies:

- Ruby
- Bundler
- RVM (optional)


Getting Started
============

To configure and run this application, do the following:

- Go to https://apps.twitter.com/ to generate access tokens for your application, any application built on the twitter API requires authentication tokens.

- Clone this repo or download the code and unzip

- `cd palindromes`

- Create a file `config/twitter.yml` and supply your access tokens in this file. You could copy `config/example.twitter.yml` and simply fill it in with your access tokens:

 `cp config/example.twitter.yml config/twitter.yml`

```
    development:
      #API key/secret
      consumer_key: API_KEY
      consumer_secret: API_SECRET
      #Access token/secret
      access_token: ACCESS_TOKEN
      access_token_secret: ACCESS_TOKEN_SECRET
```

- If on OSX and using homebrew, you may need `brew link autoconf` if it has not been linked already

- `bundle install`

- `bundle exec ruby app.rb [OPTIONS]`

### Options

```
    Available options:
        -m, --min LENGTH              Minimum palindrome length (Default: 4)
        -h, --help                    Show this message
        -l, --language LANGUAGE       Tweet language (Default: en)
```
