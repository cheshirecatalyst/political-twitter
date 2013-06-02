require './storm'

def parse_file f
  tweets = []
  file = File.new(f, 'r')
  file.each_line("\n") do |row|
    tweets << row.chomp if row.chomp.length < 140
  end
  tweets
end

tweets = parse_file './tweets'
config = {}
config[:consumer_key] = ""
config[:consumer_secret] = ""
config[:oauth_token] = ""
config[:oauth_token_secret] = ""
client = Storm.new(config)
client.tweet_all tweets