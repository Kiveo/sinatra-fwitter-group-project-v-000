require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/index' do #homepage index request
    erb :index
  end

  get '/registrations/signup' do
      erb :'/registrations/signup'
  end

  post '/signup' do #signup
    user = User.create(:username => params[:username], :password => params[:password])
  end

end
