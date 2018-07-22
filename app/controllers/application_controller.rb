require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do #homepage index request
    erb :index
  end

  get '/signup' do #signup page request
    erb :'/registrations/signup'
  end

  post '/signup' do #signup and redirect
    @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect :"/users/home"
    else
      redirect :"/sessions/failure"
    end
  end

  get "/sessions/failure" do
    erb :"/sessions/failure"
  end

  get '/sessions/login' do #login page request
    erb :"/sessions/login"
  end

  post "/sessions" do #login and redirect
    @user = User.find_by(username: params["username"], password: params["password"])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect :"/users/home"
    else
      redirect :"/sessions/failure"
    end
  end

  get '/sessions/logout' do #logout
    session.clear
    redirect :"/sessions/login"
  end

end
