require "sinatra"

# Session aren't enabled by default, so we have to opt-in to using them:
enable :sessions

get "/" do
  erb :index
end
