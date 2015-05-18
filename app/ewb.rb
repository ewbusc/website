require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/simple-navigation'
require 'haml'
require 'pony'

set :haml, :format => :html5

module Ewb
  class App < Sinatra::Base
    enable :sessions
    
    register Sinatra::Flash
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
      email = params[:email]
      body = params[:body]
      
      if email.to_s == ''
        flash[:warning] = 'We require your email!'
        redirect '/contact'
      end
      
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
                :from => "#{email}",
                :subject => "EWB-USC #{name}",
                :body => "#{body}")
      
      flash[:success] = 'Email Sent!'
      redirect '/'
    end
    
  end
end

module Sinatra
  module Flash
    module Style
      def styled_flash(key=:flash)
        return "" if flash(key).empty?
        id = (key == :flash ? "flash" : "flash_#{key}")
        close = '<a class="close" data-dismiss="alert" href="#">×</a>'
        messages = flash(key).collect {|message| " <div class='alert alert-#{message[0]}'>#{close}\n #{message[1]}</div>\n"}
        "<div id='#{id}'>\n" + messages.join + "</div>"
      end
    end
  end
end

