require_relative 'user_authentication'
require_relative 'play_button'
# Homepage (Root path)
get '/' do
  @user = User.new
  erb :index
end
