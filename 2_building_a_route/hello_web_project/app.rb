require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

  post '/submit' do
  name = params[:name]  
  message = params[:message]

  return "Thanks #{name}, you sent this message:#{message}"
  end
end

#http://localhost:9292/hello?name=Afrika
#http://localhost:9292/submit?