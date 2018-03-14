require 'sinatra/base'
require_relative './lib/link'
require_relative'./database_connection_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/input-link' do
    erb :input_link
  end

  post '/add-link' do
    Link.add(params[:url])
    redirect '/'
  end

  run! if app_file == $0
end
