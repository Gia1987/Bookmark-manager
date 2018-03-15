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
    if Link.add(params[:url])
      redirect '/'
    else
      "Sorry this is not a website"
    end
  end

  run! if app_file == $0
end
