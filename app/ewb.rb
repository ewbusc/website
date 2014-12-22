require 'rubygems'
require 'sinatra'
require 'sinatra/simple-navigation'
require 'haml'
require 'flickraw'

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
    
    get '/media' do
      redirect "https://www.flickr.com/photos/127751746@N04/"
    end
    
    get '/support' do
      haml :support
    end
    
  end
end
