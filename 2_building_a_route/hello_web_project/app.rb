require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

  post '/submit' do
  name = params[:name]  
  message = params[:message]

  return "Thanks #{name}, you sent this message:#{message}"
  end

  get '/names' do
    return "Julia, Mary, Karim"
  end

  post '/sort-names' do
    names = "Joe,Alice,Zoe,Julia,Kieran"
    sorted_names = names.split(",").sort

    return sorted_names.join(",")
  end
end

#http://localhost:9292/hello?name=Afrika
#http://localhost:9292/submit?