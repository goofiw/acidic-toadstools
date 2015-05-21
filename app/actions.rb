require_relative 'user_authentication'
# Homepage (Root path)
get '/' do
  @user = User.new
  erb :index
end
