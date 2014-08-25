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
    
    # get '/local' do
    #   haml :local
    # end
    
    get '/events' do
      haml :events
    end
    
    get '/projects' do
      haml :projects
    end
    
    get '/media' do
      haml :media
    end
    
    get '/support' do
      haml :support
    end
    
  end
end
