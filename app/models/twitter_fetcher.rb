class TwitterFetcher

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

  def kenneth_tweets
    @client.user_timeline('KennethT')
  end

  def jb
    @client.search("to:justinbieber marry me", :result_type => "recent").take(3).collect do |tweet|
     "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

end
