require_relative 'user_authentication'
require_relative 'play_button'
# Homepage (Root path)
get '/' do
  erb :index
end
