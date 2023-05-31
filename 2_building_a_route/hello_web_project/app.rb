require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

  post '/hello' do
    name = params[:name]

    return "Hello #{name}"
  end

end