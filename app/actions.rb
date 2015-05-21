require_relative 'user_authentication'
# Homepage (Root path)
get '/' do
  erb :index
end
