require 'twitter'

Twitter.configure do |config|
  config.consumer_key = "key"
  config.consumer_secret = "key"
  config.oauth_token = "key"
  config.oauth_token_secret = "key"
end

#Twitter.update("Using @gem!!!!!")
tweets = []
filename = "tweets"
file = File.new(filename, 'r')
file.each_line("\n") do |row|
  tweets.push row.chomp
end

def tweetthis(message)
  Twitter.update(message)
end

tweet = ""

loop do
  tweet = tweets.sample
  while tweet.length > 140
    tweet = tweets.sample
  end  
  begin
    tweetthis tweet
    puts "Tweeting: #{tweet}"
    sleep(Random.rand(220...360))
  rescue
    puts "Tweet failed"
    sleep(Random.rand(10..20))
  end
end
