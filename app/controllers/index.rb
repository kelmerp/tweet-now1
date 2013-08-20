get '/' do
  erb :index
end

post '/send' do
  tweet = params["body"]
  
end
