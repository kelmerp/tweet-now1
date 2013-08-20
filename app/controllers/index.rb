get '/' do
  erb :index
end

post '/send' do
  tweet = params["body"]
  puts tweet
  
  @success = CLIENT.update(tweet)
  p @success
  
  erb :index
end
