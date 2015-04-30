require 'rubygems'
require 'sinatra'
require 'sinatra/simple-navigation'
require 'haml'
require 'pony'

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
    
    get '/contact' do
      haml :contact
    end
    
    post '/contact' do
      name = params[:name]
      body = params[:body]
      
      Pony.options = {
        :via => :smtp,
        :via_options => {
          :address => 'smtp.sendgrid.net',
          :port => '587',
          :domain => 'heroku.com',
          :user_name => ENV['SENDGRID_USERNAME'],
          :password => ENV['SENDGRID_PASSWORD'],
          :authentication => :plain,
          :enable_starttls_auto => true
        }
      }
      
      Pony.mail(:to => 'soewob@mailbox.sc.edu',
                :from => "no-reply@ewb-usc.org", 
                :subject => "EWB-USC #{name}", 
                :body => "#{body}")

      haml :contact
    end
    
  end
end
