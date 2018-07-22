class UsersController < ApplicationController

  get '/users/home' do
    @user = User.find(session[:user_id])
    erb :"/users/home"
  end

end
