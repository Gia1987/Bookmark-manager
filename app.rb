require 'sinatra/base'
require_relative './lib/link'
require_relative'./database_connection_setup'
require 'uri'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/input-link' do
    erb :input_link
  end

  post '/add-link' do
    if Link.add(params[:url], params[:title])
      redirect '/'
    else
      "<a href='/input-link'>This is not a valid website, click here to go back</a>"
    end
  end

  run! if app_file == $0
end
