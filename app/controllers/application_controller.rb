require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/index' do #homepage index request
    erb :index
  end

  get '/registrations/signup' do #signup page request
    erb :'/registrations/signup'
  end

  post '/registrations' do #signup and redirect
    user = User.create(:username => params[:username], :password => params[:password])

    redirect '/users/home'
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :"/users/home"
  end

  get '/sessions/login' do #login page request
    erb :"/sessions/login"
  end

  post "/sessions" do #login and redirect
    @user = User.find_by(username: params["username"], password: params["password"])
    session[:id] = @user.id
    redirect :"/users/home"
  end
end
