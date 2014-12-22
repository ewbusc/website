require 'rubygems'
require 'sinatra'
require 'sinatra/simple-navigation'
require 'haml'

set :haml, :format => :html5

module Ewb
  class App < Sinatra::Base
    register Sinatra::SimpleNavigation
    
    get '/' do
      haml :index
    end
    
    get '/events' do
      haml :events
    end
    
    get '/projects' do
      haml :projects
    end
    
    get '/pictures' do
      redirect 'https://www.flickr.com/photos/127751746@N04/sets/'
    end
    
    get '/videos' do
      redirect 'https://www.youtube.com/user/uscewb'
    end
    
    get '/support' do
      haml :support
    end
    
  end
end
